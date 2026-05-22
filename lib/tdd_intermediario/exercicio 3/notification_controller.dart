import 'dart:async';

class NotificationController {
  // 1. Criamos o controller privado.
  // Usamos <String> para garantir que ele só aceita mensagens de texto.
  final StreamController<String> _controller = StreamController<String>();

  // 2. Expomos apenas o Stream público para o teste (e para a UI do Flutter no futuro)
  Stream<String> get notificationStream => _controller.stream;

  // 3. método que adiciona o alerta dentro do fluxo
  void sendAlert(String message) {
    _controller.add(message);
  }

  // Dica de mestre: Como criamos um StreamController, é uma excelente prática
  // criar um método para fechá-lo quando a classe for destruída, evitando vazamento de memória (Memory Leak)
  void dispose() {
    _controller.close();
  }
}
