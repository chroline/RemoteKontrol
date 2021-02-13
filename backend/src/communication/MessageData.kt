package com.colegawin.remotekontrol.backend.communication

import com.colegawin.remotekontrol.backend.server.ServerState

open class MessageData
data class TransitionData(val state: ServerState, val payload: String = "") : MessageData()
data class InstructionData(val drive: Int, val rotation: Int) : MessageData()
data class UpdateData(val drive: Int, val rotation: Int) : MessageData()
data class ErrorData(val reason: ErrorType, val message: String) : MessageData()