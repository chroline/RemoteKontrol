import {MessageData} from "./messageData";

export enum MessageType {
	INSTRUCTION,
	UPDATE,
	ERROR,
}

interface Message {
	type: string;
	data: MessageData;
}

export default Message;
