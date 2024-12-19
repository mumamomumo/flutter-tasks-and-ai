import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_and_ai/Logic/ai_logic.dart';
import 'package:tasks_and_ai/style/app_colors.dart';

import 'package:tasks_and_ai/Logic/task_logic.dart';
import 'package:tasks_and_ai/views/ai_chat.dart';
import 'package:tasks_and_ai/views/task_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Row(
        children: [
          taskColumn(context),
          const VerticalDivider(),
          BlocProvider(
            create: (context) => AiLogic(),
            child: MediaQuery.of(context).orientation == Orientation.landscape
                ? chatColumn()
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget taskColumn(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            "Tasks",
            style: TextStyle(
              fontSize: 30,
              color: AppColors.primary[500],
              fontWeight: FontWeight.bold,
            ),
          ),
          const TaskView(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.read<TaskLogic>().clearTasks();
                    },
                    child: Text(
                      "Clear Tasks",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.primary[500],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/tasks");
                    },
                    child: Text(
                      "Add Task",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.primary[500],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget chatColumn() {
    return Expanded(
      child: Column(
        children: [
          Text(
            "AI Chat",
            style: TextStyle(
              fontSize: 30,
              color: AppColors.primary[500],
              fontWeight: FontWeight.bold,
            ),
          ),
          const Expanded(child: AIChat()),
        ],
      ),
    );
  }
}
