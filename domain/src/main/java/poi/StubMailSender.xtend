package poi

import java.util.Map
import java.util.HashMap
import java.util.Set
import java.util.HashSet

class StubMailSender extends MailSender{
	Map<String, Set<String>> mailsEnviados
	
	new() {
		mailsEnviados = new HashMap<String, Set<String>>
	}
	
	override send(Mail mail) {
		simularEnvioMail(mail.from, mail.message)
	}
	
	def simularEnvioMail(String from, String message) {
		val mensajes = mailsDe(from)
		mensajes.add(message)
		mailsEnviados.put(from, mensajes)
	}
	
	def Set<String> mailsDe(String from) {
		mailsEnviados.get(from) ?: new HashSet<String> 
	}
}