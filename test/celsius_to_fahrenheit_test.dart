import 'package:praticar_1/celsius_to_fahrenheit.dart';
import 'package:test/test.dart';

void main() {
  group('Conversor de Temperatura', () {
    test('Deve retornar 32.0 ao fornecer 0°C', () {
      //Arrange
      final double celsius = 0.0;
      //Act
      final double result = celsiusToFahrenheit(celsius);
      //Assert
      expect(result, equals(32.0));
    });

    test('Deve retornar 212.0 ao fornecer 100°C', () {
      //Arrange
      final double celsius = 100;
      //Act
      final double result = celsiusToFahrenheit(celsius);
      //Assert
      expect(result, equals(212.0));
    });
  });
}
