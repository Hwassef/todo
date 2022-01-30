import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/filtred_todos.dart';
import 'package:todo_app/providers/todo_list.dart';
import 'package:todo_app/widgets/show_background.dart';
import 'package:todo_app/widgets/todo_item.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FiltredTodos>().state.filtredTodos;
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemCount: todos.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: Colors.grey);
      },
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ValueKey(todos[index].id),
          background: ShowBackground(0),
          secondaryBackground: ShowBackground(1),
          onDismissed: (_) {
            context.read<TodoList>().removeTodo(todos[index]);
          },
          confirmDismiss: (_) {
            return showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Are You Sure !'),
                    content: Text("Do you really want to delete?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text(
                          "NO",
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text("YES"),
                      ),
                    ],
                  );
                });
          },
          child: TodoItem(todo: todos[index]),
        );
      },
    );
  }
}
