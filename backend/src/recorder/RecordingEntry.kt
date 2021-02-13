package com.colegawin.remotekontrol.backend.recorder

enum class RecordingEntryType {
	INSTRUCTION, STOP
}

open class RecordingEntry(
	open val timestamp: Long,
	val type: RecordingEntryType
) {}

data class RecordingInstruction(
	override val timestamp: Long,
	val drive: Int,
	val rotation: Int
) : RecordingEntry(timestamp, RecordingEntryType.INSTRUCTION)

data class RecordingStop(
	override val timestamp: Long
) : RecordingEntry(timestamp, RecordingEntryType.STOP)