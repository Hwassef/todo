import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoFilterSate extends Equatable {
  final Filter filter;

  TodoFilterSate({required this.filter});

  factory TodoFilterSate.initial() {
    return TodoFilterSate(filter: Filter.All);
  }
  @override
  List<Object?> get props => [filter];

  @override
  bool get stingify => true;
  TodoFilterSate copyWith({
    Filter? filter,
  }) {
    return TodoFilterSate(filter: filter ?? this.filter);
  }
}

class TodoFilter with ChangeNotifier {
  TodoFilterSate _state = TodoFilterSate.initial();
  TodoFilterSate get state => _state;

  void changeFilter(Filter newFilter) {
    _state = _state.copyWith(filter: newFilter);
    notifyListeners();
  }
}
