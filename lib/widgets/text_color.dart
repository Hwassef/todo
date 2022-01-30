import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/providers/todo_filter.dart';

Color TextColor(BuildContext context, Filter filter) {
  final currentFilter = context.watch<TodoFilter>().state.filter;
  return currentFilter == filter ? Colors.blue : Colors.grey;
}
