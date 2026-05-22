import 'package:praticar_1/tdd_intermediario/exercicio%203/notification_controller.dart';
import 'package:test/test.dart';

void main() {
  group('NotificationController - Streams', () {
    test(
      'Deve emitir a mensagem correta no Stream ao disparar sendAlert',
      () async {
        // 1. Arrange
        final controller = NotificationController();
        final message = 'Alerta de Teste';

        // 2. Assert (Preparamos a escuta do Stream ANTES do Act, sem colocar o await ainda)
        final streamExpectation = expectLater(
          controller.notificationStream,
          emits(message),
        );

        // 3. Act (Disparamos o evento que vai alimentar o Stream)
        controller.sendAlert(message);

        // 4. Fechamento: Agora sim esperamos a validação do Stream terminar
        await streamExpectation;
      },
    );
  });
}
