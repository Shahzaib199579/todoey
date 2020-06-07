import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkBoxCallback: (checkBoxState) {
                  taskData.updatedTask(taskData.tasks[index]);
                },
                onLongPress: () {
                  taskData.removeTask(taskData.tasks[index]);
                },
            );
          },
          itemCount: taskData.tasks.length,
        );
      }
    );
  }
}
