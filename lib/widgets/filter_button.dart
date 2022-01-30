import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/providers/todo_filter.dart';
import 'package:todo_app/widgets/text_color.dart';
import 'package:provider/provider.dart';

@override
Widget filterButton(BuildContext context, Filter filter) {
  return TextButton(
    onPressed: () {
      context.read<TodoFilter>().changeFilter(filter);
    },
    child: Text(
      filter == Filter.All
          ? 'All'
          : filter == Filter.Active
              ? 'Active'
              : 'Completed',
      style: TextStyle(
        fontSize: 18.0,
        color: textColor(context, filter),
      ),
    ),
  );
}
