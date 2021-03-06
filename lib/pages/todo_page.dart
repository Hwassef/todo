import 'package:flutter/material.dart';
import 'package:todo_app/widgets/create_todo.dart';
import 'package:todo_app/widgets/search_and_filter_todo.dart';
import 'package:todo_app/widgets/show_todos.dart';
import 'package:todo_app/widgets/todo_header.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 40.0,
            ),
            child: Column(
              children: [
                TodoHeader(),
                CreateTodo(),
                SizedBox(height: 20.0),
                SearchAndFilterTodo(),
                SizedBox(
                  height: 15.0,
                ),
                ShowTodos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
