import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:todo_list/screens/add_task.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:todo_list/screens/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<TaskData>(context, listen: false).loadTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.MMMEd().format(DateTime.now()),
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        '${Provider.of<TaskData>(context).unFinishedTasks} TASKS',
                        style: Theme.of(context).textTheme.headline2),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        '${Provider.of<TaskData>(context).finishedTasks} complited',
                        style: Theme.of(context).textTheme.headline1),
                  ],
                ),
              ],
            ),
          ),
          const TaskList(),
          const AddTask(),
        ]),
      ),
    );
  }
}
