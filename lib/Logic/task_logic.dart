import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class TaskLogic extends Cubit<List<Task>> {
  TaskLogic() : super(<Task>[]);

  void addTask(String task) {
    var newTask = Task(id: const Uuid().v4(), taskName: task);
    emit([...state, newTask]);
  }

  void clearTasks() {
    emit(<Task>[]);
  }

  void removeTask(String id) {
    emit([...state]..removeWhere((task) => task.id == id));
  }

  void toggleTask(Task task) {
    var updatedTasks = state
        .map((t) => t.id == task.id
            ? Task(
                taskName: task.taskName,
                isCompleted: !task.isCompleted,
                id: task.id)
            : t)
        .toList();
    emit([...updatedTasks]);
  }

  void reorderTask(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final task = state.removeAt(oldIndex);
    state.insert(newIndex, task);
  }
}

class Task {
  final String taskName;
  final bool isCompleted;
  final String id;

  Task({required this.taskName, this.isCompleted = false, required this.id});
}
