package com.colegawin.remotekontrol.backend.communication

import com.beust.klaxon.TypeAdapter
import kotlin.reflect.KClass

class MessageDataAdapter : TypeAdapter<MessageData> {
	override fun classFor(type: Any): KClass<out MessageData> = when (MessageType.valueOf(type as String)) {
		MessageType.TRANSITION -> TransitionData::class
		MessageType.INSTRUCTION -> InstructionData::class
		MessageType.UPDATE -> UpdateData::class
		else -> throw IllegalArgumentException("Unknown type: $type")
	}
}