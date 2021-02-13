package com.colegawin.remotekontrol.backend.server

import io.ktor.http.cio.websocket.Frame
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.channels.consumeEach
import kotlinx.coroutines.launch

object Connections {
	val set = mutableSetOf<suspend (Frame) -> Unit>()

	fun channel(): Channel<suspend (Frame) -> Unit> {
		val channel = Channel<(suspend (frame: Frame) -> Unit)>()
		GlobalScope.launch { channel.consumeEach { set.add(it) } }
		return channel
	}
}