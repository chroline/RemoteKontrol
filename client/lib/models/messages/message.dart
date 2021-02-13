import 'package:client/models/messages/message_data.dart';

enum MessageType { ACCESS_CHANGE, TRANSITION, INSTRUCTION, UPDATE, ERROR }

class Message {
  final MessageType type;
  final MessageData data;

  Message(this.type, this.data);

  Map<String, dynamic> toJson() => {
        'type': type.toString().substring(12),
        'data': data.toJson(),
      };
}
