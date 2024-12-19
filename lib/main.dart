import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_and_ai/Logic/task_logic.dart';
import 'package:tasks_and_ai/Pages/task_page.dart';
import 'package:tasks_and_ai/style/app_colors.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskLogic>(
          create: (context) => TaskLogic(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: AppColors.colorScheme),
        routes: {
          "/": (context) => const HomePage(),
          "/tasks": (context) => const TaskPage(),
        },
      ),
    );
  }
}
