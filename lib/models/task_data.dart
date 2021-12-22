import 'dart:collection';
import 'package:flutter/foundation.dart';

import 'package:todo_list/models/tasks.dart';
import 'package:todo_list/shared_prefrences_tasks.dart';

class TaskData extends ChangeNotifier {
  static const sharedPrefKey = "ToDoListKey";

  List<Task> _tasks = [];
  List<Task> _finishedTasks = [];
  List<Task> _unFinishedTasks = [];
  static const String todoListKey = 'todoList';
  SharedPrefrencesTasks sharedPrefrencesTasks = SharedPrefrencesTasks();

  int get taskCount {
    return _tasks.length;
  }

  int get finishedTasks {
    _finishedTasks = _tasks.where((element) => element.isChedcked).toList();
    return _finishedTasks.length;
  }

  int get unFinishedTasks {
    _unFinishedTasks =
        _tasks.where((element) => element.isChedcked == false).toList();
    return _unFinishedTasks.length;
  }

  UnmodifiableListView<Task> get tasksList {
    return UnmodifiableListView(_tasks.reversed);
  }

  void addTask(String newTask) async {
    final task = Task(name: newTask);
    _tasks.add(task);
    await sharedPrefrencesTasks.saveTasks(_tasks);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.changeState();
    notifyListeners();
    sharedPrefrencesTasks.saveTasks(_tasks);
  }

  void deleteTask(Task task) async {
    _tasks.remove(task);
    await sharedPrefrencesTasks.saveTasks(_tasks);
    notifyListeners();
  }

  Future<void> loadTasks() async {
    _tasks = await sharedPrefrencesTasks.getAllTasks();
    notifyListeners();
  }
}
