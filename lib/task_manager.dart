class TaskManager {
  String addTask(String title) {
    if (title == '') {
      throw ArgumentError();
    }
    return 'Tarefa adicionada com sucesso!';
  }
}
