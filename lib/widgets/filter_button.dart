import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

@override
Widget FilterButton(BuildContext context, Filter filter) {
  return TextButton(
    onPressed: () {},
    child: Text(
      filter == Filter.All
          ? 'All'
          : filter == Filter.Active
              ? 'Active'
              : 'Completed',
      style: const TextStyle(
        fontSize: 18.0,
        color: TextColor(context, filter),
      ),
    ),
  );
}
