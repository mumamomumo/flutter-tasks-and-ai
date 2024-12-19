import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_and_ai/Logic/ai_logic.dart';
import 'package:tasks_and_ai/style/app_colors.dart';

class AIChat extends StatefulWidget {
  const AIChat({super.key});

  @override
  State<AIChat> createState() => _AIChatState();
}

class _AIChatState extends State<AIChat> {
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  dispose() {
    super.dispose();
    textController.dispose();
  }

  _scrollToBottom() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<AiLogic, Map<String, String>>(
            builder: (context, state) {
              var keys = state.keys.toList();
              var values = state.values.toList();
              return ListView.builder(
                controller: scrollController,
                itemCount: state.length,
                itemBuilder: (context, index) {
                  var alignment = keys[index].split(" ")[0] == "User"
                      ? Alignment.centerRight
                      : Alignment.centerLeft;
                  return Container(
                    key: ValueKey(keys[index]),
                    alignment: alignment,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.background[900],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(values[index]),
                  );
                },
              );
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: userInput(),
            ),
            IconButton(
              onPressed: () {
                if (textController.text.isEmpty) return;
                context.read<AiLogic>().sendMessage(textController.text);
                textController.clear();
              },
              icon: const Icon(Icons.send),
            ),
            IconButton(
              onPressed: () {
                context.read<AiLogic>().clearHistory();
              },
              icon: const Icon(Icons.delete),
              tooltip: "Clear History",
            ),
          ],
        )
      ],
    );
  }

  Widget userInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter Prompt",
        ),
        onSubmitted: (value) {
          if (value.isEmpty) return;
          context.read<AiLogic>().sendMessage(value);
          textController.clear();
        },
      ),
    );
  }
}
