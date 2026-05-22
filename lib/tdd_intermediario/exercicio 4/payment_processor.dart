import 'package:praticar_1/tdd_intermediario/exercicio%204/logger_service.dart';

class PaymentProcessor {
  final LoggerService _loggerService;

  PaymentProcessor({required LoggerService loggerService})
    : _loggerService = loggerService;

  void process() {
    _loggerService.info('Sucesso');
  }
}
