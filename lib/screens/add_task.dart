import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/models/task_data.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context);
    TextEditingController _controller = TextEditingController();
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    String newTask = '';

    return SizedBox(
      height: (deviceData.size.height - deviceData.padding.top) * 0.06,
      child: Platform.isIOS
          ? LayoutBuilder(
              builder: (context, constraints) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxHeight * 0.2,
                ),
                child: CupertinoTextField(
                  onChanged: (value) {
                    newTask = value;
                  },
                  controller: _controller,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 22 * curScaleFactor,
                      ),
                  placeholder: 'A new task',
                  placeholderStyle:
                      Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 22 * curScaleFactor,
                          ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2)),
                  prefix: IconButton(
                    onPressed: () {
                      _controller.clear();
                    },
                    icon: Icon(
                      CupertinoIcons.clear,
                      size: constraints.maxHeight * 0.4,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  suffix: IconButton(
                    onPressed: () {
                      if (newTask.isEmpty) {
                      } else {
                        Provider.of<TaskData>(context, listen: false)
                            .addTask(newTask);
                        _controller.clear();
                        newTask = '';
                      }
                    },
                    icon: Icon(
                      CupertinoIcons.arrow_up_circle_fill,
                      size: constraints.maxHeight * 0.6,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            )
          : ListTile(
              title: TextField(
                style: Theme.of(context).textTheme.bodyText1,
                controller: _controller,
                onChanged: (value) {
                  newTask = value;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).primaryColor,
                  hintText: 'A new task',
                  hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 22 * curScaleFactor,
                      ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
              ),
              trailing: TextButton(
                onPressed: () {
                  if (newTask.isEmpty) {
                  } else {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTask);

                    _controller.clear();
                    newTask = '';
                  }
                },
                child:
                    Text('Add', style: Theme.of(context).textTheme.bodyText1),
              )),
    );
  }
}
