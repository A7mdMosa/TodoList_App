import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/todo_theme.dart';

import '/models/task_data.dart';
import '/screens/home_screen.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ToDoTheme.light();
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: theme,
        title: 'To Do',
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
