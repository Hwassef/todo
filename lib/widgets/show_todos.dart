import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/filtred_todos.dart';
import 'package:todo_app/widgets/show_background.dart';

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
          child: Text(
            todos[index].desc,
            style: TextStyle(fontSize: 18.0),
          ),
        );
      },
    );
  }
}
