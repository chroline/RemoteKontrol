package com.colegawin.remotekontrol.backend.communication

import com.beust.klaxon.Klaxon
import com.beust.klaxon.TypeFor

class Message(
	@TypeFor(field = "data", adapter = MessageDataAdapter::class)
	val type: MessageType,

	val data: MessageData
) {
	companion object {
		fun from(data: String) = Klaxon().parse<Message>(data)
	}
}