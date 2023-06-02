import venom from 'venom-bot';

const sessions = ['tim', 'vivo']; // Substitua pelos nomes das sessões que deseja conectar

const createSessions = async () => {
	for (let session of sessions) {
		const client = await venom.create(session, (base64Qr, asciiQR) => {
			console.log(asciiQR); // Exibe o QR code no console para cada sessão
		});

		client.onStateChange((state) => {
			console.log('State changed:', state); // Exibe o estado de autenticação da sessão
			if (state === 'CONFLICT') client.useHere();
		});

		start(client);

		console.log(`Sessão ${session} conectada com sucesso!`);
	}
};

createSessions().catch((error) => {
	console.log('Error:', error);
});

function start(client) {
	console.log('====================================');
	console.log(client.session);
	console.log('====================================');
	client.onMessage((message) => {
		if (client.session === 'vivo') {
			client.sendText(message.from, 'Olá! Como posso ajudar?');
		}
	});
}