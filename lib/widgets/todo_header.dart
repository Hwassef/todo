import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo_app/providers/active_todo_count.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'TODO',
          style: TextStyle(fontSize: 40.0),
        ),
        Text(
          '${context.watch<ActiveTodoCount>().state.activeTodoCount} Items Left',
          style: const TextStyle(fontSize: 20.0, color: Colors.redAccent),
        ),
      ],
    );
  }
}
