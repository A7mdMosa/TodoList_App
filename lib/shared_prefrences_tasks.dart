import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/tasks.dart';

class SharedPrefrencesTasks {
  static const sharedPrefKey = "ToDoListKey";

  Future<void> _saveListPref(String key, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  Future<void> saveTasks(List<Task> tasks) async {
    String tasksJson = jsonEncode(tasks);
    await _saveListPref(sharedPrefKey, tasksJson);
  }

  Future<String> _getListFromPref(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String value = pref.getString(key) ?? '';
    return value;
  }

  List<Task> _tasksFromJson(String json) {
    List<Task> tasks = [];
    if (json == '') {
      return tasks;
    } else {
      final taskList = jsonDecode(json);
      for (Map<String, dynamic> taskMap in taskList) {
        Task task = Task.fromjson(taskMap);
        tasks.add(task);
      }
      return tasks;
    }
  }

  Future<List<Task>> getAllTasks() async {
    String tasksJsonString = await _getListFromPref(sharedPrefKey);
    List<Task> tasks = _tasksFromJson(tasksJsonString);
    return tasks;
  }
}
