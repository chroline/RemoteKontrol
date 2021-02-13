import * as WebSocket from "ws";
import Message, { MessageType } from "./communication/message";
import { InstructionData } from "./communication/messageData";
import { Board, Servo } from "johnny-five";

const board = new Board({
  port: "/dev/cu.RemoteKontrol-DevB",
});

let left: Servo;
let right: Servo;

function adjustSpeeds(drive: number, rotation: number) {
  const ls = ((drive + rotation) / 2) * 10 + 90;
  const rs = (-(drive - rotation) / 2) * 10 + 90;
  console.log(`ls: ${ls}, rs: ${rs}`);
  left.to(ls);
  right.to(rs);
}

function main() {
  board.on("ready", () => {
    left = new Servo({
      pin: 11,
      type: "continuous",
    });
    right = new Servo({
      pin: 10,
      type: "continuous",
    });
    listen();
  });
}

function listen() {
  const ws = new WebSocket("ws://localhost:8080/interop");

  ws.on("message", function incoming(data) {
    const message: Message = JSON.parse(data as string);
    switch (MessageType[message.type]) {
      case MessageType.INSTRUCTION:
        const speed = message.data as InstructionData;
        const total = Math.abs(speed.drive) + Math.abs(speed.rotation);
        const drive =
          Math.round((speed.drive / total) * Math.abs(speed.drive)) || 0;
        const rotation =
          Math.round((speed.rotation / total) * Math.abs(speed.rotation)) || 0;
        const response = JSON.stringify({
          type: MessageType[MessageType.UPDATE],
          data: {
            drive,
            rotation,
          },
        });
        adjustSpeeds(drive / 10, rotation / 10);
        ws.send(response);
      default:
    }
  });
}

main();
