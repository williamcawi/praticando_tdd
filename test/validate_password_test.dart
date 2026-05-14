import 'package:praticar_1/validate_password.dart';
import 'package:test/test.dart';

void main() {
  group('validação de senha', () {
    test('A senha deve ter pelo menos 8 caracteres', () {
      // Arrange
      final String senha = '123456789';
      //Act
      final result = validatePassword(senha);
      //Assert
      expect(result, 'A senha tem mais de 8 caracteres!');
    });

    test('A senha deve ter 8 caracteres!', () {
      //Arrange
      final String senha = '12345678';
      //Act
      final result = validatePassword(senha);
      //Assert
      expect(result, 'A senha tem 8 caractares!');
    });

    test('Se a senha tiver menos de 8 caracteres', () {
      //Arrange
      final String senha = '12';
      //Act
      final String result = validatePassword(senha);
      //Assert
      expect(result, 'a senha tem pelo menos de 8 caracteres!');
    });
  });
}
