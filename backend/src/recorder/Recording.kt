package com.colegawin.remotekontrol.backend.recorder

class Recording(val name: String) {
	val entries = mutableListOf<RecordingEntry>()

	var lastTimestamp: Long? = null;

	fun end() {}
}