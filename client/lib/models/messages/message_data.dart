import 'package:client/ctrls/ctrls.dart';

abstract class MessageData {
  Map<String, dynamic> toJson();
}

class InstructionData extends MessageData {
  final int drive;
  final int rotation;

  InstructionData(this.drive, this.rotation);

  @override
  Map<String, dynamic> toJson() => {'drive': drive, 'rotation': rotation};
}

class UpdateData extends InstructionData {
  UpdateData(int drive, int rotation) : super(drive, rotation);
}

class TransitionData extends MessageData {
  final ServerState state;

  TransitionData(this.state);

  @override
  Map<String, dynamic> toJson() => {'state': state.toString().substring(12)};
}
