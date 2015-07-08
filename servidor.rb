require 'socket'
#require 'rdbi-driver-sqlite3'

# conectando ao BD
#banco = RDBI.connect(:SQLite3, :database => "consulta.db")

def processa_mensagem(d0)
	if d0 == "REG"
		# chama o método para o registro no bd
		"A mensagem foi de REGISTRO"
	elsif d0 == "IP"
		# executa o códido de consulta no BD e retorna o resultado
		" A mensagem foi de CONSULTA"
	else
		"ERRO!!!!"
	end
end

socket = UDPSocket.new
socket.bind("",2100)


loop{
	data, sender = socket.recvfrom(1024)
	cliente_ip = sender[3]
	cliente_port = sender[1]
	dados = data.split
	puts processa_mensagem(dados[0])
	socket.send(processa_mensagem(dados[0]), 0, cliente_ip, cliente_port)
	break
}
# desconectando o BD antes de fechar o servidor
#banco.disconnect


