import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoeyflutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get getCount {
    return _tasks.length;
  }

  void addTask(String taskName) {
    Task newTask = new Task(name: taskName, isDone: false);
    _tasks.add(newTask);

    notifyListeners();
  }

  void updatedTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}