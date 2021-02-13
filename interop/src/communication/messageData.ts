export interface MessageData {}

export interface InstructionData extends MessageData {
  drive: number;
  rotation: number;
}

export interface UpdateData extends InstructionData {}

export interface ErrorData {
  message: string;
  reason: string;
}
