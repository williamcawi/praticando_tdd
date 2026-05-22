// 1. Criamos o Mock para o LoggerService
import 'package:mocktail/mocktail.dart';
import 'package:praticar_1/tdd_intermediario/exercicio%204/logger_service.dart';
import 'package:praticar_1/tdd_intermediario/exercicio%204/payment_processor.dart';
import 'package:test/test.dart';

class MockLoggerService extends Mock implements LoggerService {}

void main() {
  late PaymentProcessor paymentProcessor;
  late MockLoggerService mockLogger;

  setUp(() {
    mockLogger = MockLoggerService();
    // Injetamos o mock do logger no processador de pagamentos
    paymentProcessor = PaymentProcessor(loggerService: mockLogger);
  });

  group('PaymentProcessor - Verificação de Interações', () {
    test('Deve registrar um log de sucesso ao processar o pagamento', () {
      // Arrange (Opcional aqui, já que o método do logger geralmente é void e não precisa retorna nada)

      // Act
      paymentProcessor.process();

      // Assert (Aqui usamos o verify em vez do expect!)
      verify(() => mockLogger.info('Sucesso')).called(1);
    });
  });
}
