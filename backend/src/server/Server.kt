package com.colegawin.remotekontrol.backend.server

import com.colegawin.remotekontrol.backend.communication.InstructionData
import com.colegawin.remotekontrol.backend.communication.Message
import com.colegawin.remotekontrol.backend.communication.MessageType
import com.colegawin.remotekontrol.backend.communication.TransitionData
import com.colegawin.remotekontrol.backend.recorder.Recording
import com.colegawin.remotekontrol.backend.recorder.RecordingException
import com.colegawin.remotekontrol.backend.recorder.RecordingInstruction

object Server {
	var client: Connection? = null;
	var interop: Connection? = null;

	var state: ServerState = ServerState.OPERATING

	var recording: Recording? = null;

	suspend fun emit(to: ConnectionType, message: Message) {
		when (to) {
			ConnectionType.CLIENT -> client?.send(message)
			ConnectionType.INTEROP -> interop?.send(message)
		}
	}

	suspend fun instruct(data: InstructionData) {
		if (state == ServerState.OPERATING) move(data)
		else if (state == ServerState.RECORDING && recording != null) {
			val (drive, rotation) = data
			val currentMs = System.currentTimeMillis()
			recording!!.entries.add(
				RecordingInstruction(
					when (recording!!.lastTimestamp) {
						null -> 0
						else -> recording!!.lastTimestamp!! - currentMs
					}, drive, rotation
				)
			)
			recording!!.lastTimestamp = currentMs
			move(data)
		}
	}

	private suspend fun move(data: InstructionData) {
		interop?.send(Message(MessageType.INSTRUCTION, data))
	}

	suspend fun transition(data: TransitionData) {
		val (transition, payload) = data
		state = when (transition) {
			ServerState.OPERATING -> {
				if (state == ServerState.RECORDING) state
				else transition
			}
			ServerState.BRAKE -> transition
			ServerState.EXECUTING -> transition
			ServerState.RECORDING -> {
				if (payload != "") {
					recording = Recording(payload)
				} else throw RecordingException("Name is not provided")
				transition
			}
			ServerState.STOP_RECORDING -> {
				recording?.end()
				ServerState.OPERATING
			}
		}
		client?.send(Message(MessageType.TRANSITION, TransitionData(state)))
	}
}