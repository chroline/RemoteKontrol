import 'dart:convert';

import 'package:client/models/messages/message.dart';
import 'package:client/models/messages/message_data.dart';
import 'package:client/models/speed.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';

enum ServerState { OPERATING, BRAKE, RECORDING, STOP_RECORDING, EXECUTING }

class ServerConnection {
  // ignore: close_sinks
  BehaviorSubject<String> serverURL$;

  // ignore: close_sinks
  final BehaviorSubject<ServerState> serverState$ =
      BehaviorSubject.seeded(null);

  // ignore: close_sinks
  final BehaviorSubject<Speed> speed$ = BehaviorSubject.seeded(null);

  IOWebSocketChannel ws;

  ServerConnection() {
    init();
  }

  void init() async {
    speed$.add(Speed(5, 6));

    final prefs = await SharedPreferences.getInstance();
    serverURL$ = BehaviorSubject.seeded(
        prefs.getString("serverURL") ?? "192.168.86.28:8080");
    serverURL$.listen((value) async {
      ws?.sink?.close();
      prefs.setString("serverURL", value);
      if (value != null) {
        ws = IOWebSocketChannel.connect('ws://$value/client');
        ws.stream.listen(handleStreamMessage);
      }
    });
  }

  void setSpeed(List<int> speed) {
    print(ws.sink);
    ws.sink.add(jsonEncode(
        Message(MessageType.INSTRUCTION, InstructionData(speed[0], speed[1]))));
  }

  void handleStreamMessage(dynamic event) {
    Map<String, dynamic> messageMap = jsonDecode(event);
    MessageType messageType = MessageType.values
        .firstWhere((e) => e.toString() == "MessageType.${messageMap['type']}");
    switch (messageType) {
      case MessageType.UPDATE:
        dynamic data = messageMap['data'];
        speed$.add(Speed(data['drive'], data['rotation']));
        break;
      case MessageType.TRANSITION:
        serverState$.add(ServerState.values.firstWhere((e) =>
            e.toString() == "ServerState.${messageMap['data']['state']}"));
        break;
      case MessageType.ERROR:
        print("err");
        break;
      default:
        print("oop");
    }
  }
}
