import 'package:praticar_1/tdd_iniciante/task_manager.dart';
import 'package:test/test.dart';

void main() {
  late TaskManager taskManager;

  setUp(() {
    taskManager = TaskManager();
  });

  group('Validando a classe TaskManager', () {
    test('Deve retornar um ArgumentError se caso o title estiver vazio', () {
      //Arrange
      final String title = '';
      //Act & Assert
      expect(() => taskManager.addTask(title), throwsArgumentError);
    });

    test('deve retornar uma mensagem de sucesso se o titulo não for vazio', () {
      //Arrange
      final String title = 'teste';
      //Act
      final String result = taskManager.addTask(title);
      //Assert
      expect(result, isA<String>());
      expect(result, equals('Tarefa adicionada com sucesso!'));
    });
  });
}
