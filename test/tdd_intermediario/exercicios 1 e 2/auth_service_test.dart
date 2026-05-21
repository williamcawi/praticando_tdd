import 'package:praticar_1/tdd_intermediario/exercicios%201%20e%202/auth_service.dart';
import 'package:praticar_1/tdd_intermediario/exercicios%201%20e%202/user_repository.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late UserRepository userRepository;
  late AuthService authService;

  setUp(() {
    userRepository = MockUserRepository();
    authService = AuthService(userRepository: userRepository);
  });

  group('validando a classe AuthService', () {
    test('Deve retornar false se a idade do usuário for menor que 18', () {
      //Arrange
      final String userId = 'id_qualquer_menor';
      when(() => userRepository.userAge(userId: userId)).thenReturn(15);
      //Act
      final bool result = authService.isAdult(userId: userId);
      //Assert
      expect(result, isFalse);
    });

    test(
      'Deve retornar true se a idade do usuário for maior ou igual a 18',
      () {
        //Arrange
        final String userId = 'id_qualquer_maior';
        when(() => userRepository.userAge(userId: userId)).thenReturn(21);
        //Act
        final bool result = authService.isAdult(userId: userId);
        //Assert
        expect(result, equals(true));
      },
    );
  });

  test('Deve retornar false se o UserRepository lançar uma Exception', () {
    //Arrange
    final String userId = 'id_com_erro';
    when(() => userRepository.userAge(userId: userId)).thenThrow(Exception());
    //Act
    final bool result = authService.isAdult(userId: userId);
    //Assert
    expect(result, isFalse);
  });
}
