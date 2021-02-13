package com.colegawin.remotekontrol.backend

import com.colegawin.remotekontrol.backend.server.Connection
import com.colegawin.remotekontrol.backend.server.ConnectionType
import com.colegawin.remotekontrol.backend.server.Server
import io.ktor.application.Application
import io.ktor.application.call
import io.ktor.application.install
import io.ktor.features.CORS
import io.ktor.http.ContentType
import io.ktor.http.HttpHeaders
import io.ktor.http.HttpMethod
import io.ktor.http.cio.websocket.pingPeriod
import io.ktor.http.cio.websocket.timeout
import io.ktor.response.respondText
import io.ktor.routing.get
import io.ktor.routing.routing
import io.ktor.server.engine.embeddedServer
import io.ktor.server.netty.Netty
import io.ktor.websocket.WebSockets
import io.ktor.websocket.webSocket
import java.time.Duration

fun startServer() {
	embeddedServer(
		Netty,
		watchPaths = listOf("RemoteKontrol/backend"),
		port = 8080,
		module = Application::module
	).apply { start(wait = true) }
}

@Suppress("unused") // Referenced in application.conf
fun Application.module() {
	install(CORS) {
		method(HttpMethod.Options)
		method(HttpMethod.Put)
		method(HttpMethod.Delete)
		method(HttpMethod.Patch)
		header(HttpHeaders.Authorization)
		header("MyCustomHeader")
		allowCredentials = true
		anyHost() // @TODO: Don't do this in production if possible. Try to limit it.
	}

	install(WebSockets) {
		pingPeriod = Duration.ofSeconds(15)
		timeout = Duration.ofSeconds(15)
		maxFrameSize = Long.MAX_VALUE
		masking = false
	}

	routing {
		get("/") {
			call.respondText("HELLO WORLDDD yay!", contentType = ContentType.Text.Plain)
		}

		webSocket("/client") {
			val connection = Connection(this, ConnectionType.CLIENT)
			connection.begin()
		}

		webSocket("/interop") {
			val connection = Connection(this, ConnectionType.INTEROP)
			Server.interop = connection;
			connection.begin()
		}
	}
}

