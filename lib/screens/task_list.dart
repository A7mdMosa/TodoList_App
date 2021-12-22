import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/models/task_data.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Expanded(
          child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemBuilder: (context, index) {
                final task = taskData.tasksList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                task.isChedcked
                                    ? Icons.check
                                    : Icons.circle_outlined,
                                size: 23,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () {
                                taskData.updateTask(task);
                              },
                            ),
                            InkWell(
                              onTap: () {
                                taskData.updateTask(task);
                              },
                              child: Text(
                                task.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        decoration: task.isChedcked
                                            ? TextDecoration.lineThrough
                                            : null),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 23,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          onPressed: () {
                            taskData.deleteTask(task);
                          },
                        ),
                      ]),
                );
              },
              itemCount: taskData.taskCount),
        );
      },
    );
  }
}
