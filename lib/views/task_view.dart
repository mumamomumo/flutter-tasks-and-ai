import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_and_ai/Logic/task_logic.dart';
import 'package:tasks_and_ai/style/app_colors.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskLogic, List<Task>>(
      builder: (context, state) {
        return Expanded(
          child: ReorderableListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return TaskTemplate(
                key: ValueKey(state[index]),
                task: state[index],
              );
            },
            onReorder: (oldIndex, newIndex) =>
                context.read<TaskLogic>().reorderTask(oldIndex, newIndex),
          ),
        );
      },
    );
  }
}

class TaskTemplate extends StatefulWidget {
  final Task task;
  const TaskTemplate({super.key, required this.task});

  @override
  State<TaskTemplate> createState() => _TaskTemplateState();
}

class _TaskTemplateState extends State<TaskTemplate> {
  @override
  Widget build(BuildContext context) {
    bool isCompleted = widget.task.isCompleted;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.background[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // GestureDetector(
          //   onTap: () {
          //     setState(() {
          //       isCompleted = !isCompleted;
          //     });
          //     context.read<TaskLogic>().toggleTask(widget.task);
          //   },
          //   child: isCompleted
          //       ? Lottie.asset("assets/lottie/check.json")
          //       : Lottie.asset("assets/lottie/uncheck.json"),
          // ),
          Checkbox(
            value: isCompleted,
            onChanged: (value) {
              context.read<TaskLogic>().toggleTask(widget.task);
              isCompleted = widget.task.isCompleted;
              setState(() {});
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                widget.task.taskName,
                style: TextStyle(
                    color: isCompleted
                        ? AppColors.primary[500]
                        : AppColors.background[100],
                    fontSize: 20,
                    decoration: isCompleted
                        ? TextDecoration.combine([
                            TextDecoration.lineThrough,
                          ])
                        : TextDecoration.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: widget.task.isCompleted
                  ? () {
                      context.read<TaskLogic>().removeTask(widget.task.id);
                    }
                  : null,
              icon: Icon(
                Icons.delete,
                color: widget.task.isCompleted ? Colors.red : Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
