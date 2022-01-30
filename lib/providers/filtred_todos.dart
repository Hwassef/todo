import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/providers/todo_filter.dart';
import 'package:todo_app/providers/todo_list.dart';
import 'package:todo_app/providers/todo_search.dart';

class FiltredTodosState extends Equatable {
  final List<Todo> filtredTodos;

  FiltredTodosState({
    required this.filtredTodos,
  });
  factory FiltredTodosState.initial() {
    return FiltredTodosState(filtredTodos: []);
  }

  @override
  List<Object> get props => [filtredTodos];
  @override
  bool get stringify => true;

  FiltredTodosState copyWith({
    List<Todo>? filtredTodos,
  }) {
    return FiltredTodosState(
      filtredTodos: filtredTodos ?? this.filtredTodos,
    );
  }
}

class FiltredTodos with ChangeNotifier {
  FiltredTodosState _state = FiltredTodosState.initial();
  FiltredTodosState get state => _state;
  void update(
    TodoFilter todoFilter,
    TodoSearch todoSearch,
    TodoList todoList,
  ) {
    List<Todo> _filtredTodos;
    switch (todoFilter.state.filter) {
      case Filter.Active:
        _filtredTodos =
            todoList.state.todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.Completed:
        _filtredTodos =
            todoList.state.todos.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.All:
        _filtredTodos = todoList.state.todos;
        break;
    }
    if (todoSearch.state.searchTerm.isNotEmpty) {
      _filtredTodos = _filtredTodos
          .where((Todo todo) =>
              todo.desc.toLowerCase().contains(todoSearch.state.searchTerm))
          .toList();
    }
    _state = _state.copyWith(filtredTodos: _filtredTodos);
    notifyListeners();
  }
}
