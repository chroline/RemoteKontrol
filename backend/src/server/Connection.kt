package com.colegawin.remotekontrol.backend.server

import com.beust.klaxon.Klaxon
import com.colegawin.remotekontrol.backend.communication.*
import com.colegawin.remotekontrol.backend.recorder.RecordingException
import io.ktor.http.cio.websocket.Frame
import io.ktor.http.cio.websocket.close
import io.ktor.http.cio.websocket.readText
import io.ktor.websocket.WebSocketServerSession
import kotlinx.coroutines.channels.consumeEach
import kotlin.random.Random

class Connection(private val socket: WebSocketServerSession, val type: ConnectionType) {
	private var open = true

	suspend fun send(message: Message) {
		socket.send(Frame.Text(Klaxon().toJsonString(message)))
		println(type);
	}

	val uuid = run {
		val chars = "abcdefghijklmnopqrstuvwxyz0123456789"
		(Array(8) {
			val index = Random.nextInt(0, chars.length)
			chars[index].toString()
		}).reduce { acc, string -> acc + string }
	}

	suspend fun begin() {
		try {
			if (type == ConnectionType.CLIENT) {
				Server.emit(
					ConnectionType.CLIENT,
					Message(MessageType.ACCESS_CHANGE, MessageData())
				)
				Server.client = this;
			} else {
				Server.interop = this;
			}
			receiveMessages()
		} finally {
			close()
		}
	}

	private suspend fun receiveMessages() {
		socket.incoming.consumeEach { frame ->
			if (frame is Frame.Text) {
				val message = messageHandler(frame)
				println(message?.type);
				if (message != null)
					when (message.type) {
						MessageType.TRANSITION -> {
							try {
								Server.transition(message.data as TransitionData)
							} catch (e: Exception) {
								when (e) {
									is RecordingException -> socket.send(
										Frame.Text(
											Klaxon().toJsonString(
												Message(MessageType.ERROR, ErrorData(ErrorType.INVALID_DATA, e.message!!))
											)
										)
									)
									else -> socket.send(
										Frame.Text(
											Klaxon().toJsonString(
												Message(MessageType.ERROR, ErrorData(ErrorType.SERVER, e.message!!))
											)
										)
									)
								}
							}
						}
						MessageType.INSTRUCTION -> Server.instruct(message.data as InstructionData)
						MessageType.ERROR -> socket.send(Frame.Text(Klaxon().toJsonString(message)))
						MessageType.UPDATE -> Server.emit(ConnectionType.CLIENT, message)
						else -> socket.send(Frame.Text(Klaxon().toJsonString(message)))
					}
				else
					socket.send(
						Frame.Text(
							Klaxon().toJsonString(
								Message(MessageType.ERROR, ErrorData(ErrorType.SERVER, "Unknown server error"))
							)
						)
					)
			}
		}
	}

	private val messageHandler = { value: Frame.Text ->
		try {
			Message.from(value.readText())
		} catch (e: Exception) {
			when (e) {
				is com.beust.klaxon.KlaxonException -> {
					Message(
						type = MessageType.ERROR,
						data = ErrorData(ErrorType.INVALID_DATA, e.message!!)
					)
				}
				is java.lang.IllegalArgumentException -> Message(
					type = MessageType.ERROR,
					data = ErrorData(ErrorType.INVALID_DATA, e.message!!)
				)
				else -> {
					Message(
						type = MessageType.ERROR,
						data = ErrorData(ErrorType.SERVER, e.message!!)
					)
				}
			}
		}
	}

	private suspend fun close() {
		when (type) {
			ConnectionType.CLIENT -> Server.client = null;
			ConnectionType.INTEROP -> Server.interop = null;
		}
		open = false
		socket.close()
	}
}
