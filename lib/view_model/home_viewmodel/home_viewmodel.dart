import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/core/error/error.dart';
import 'package:todo/model/todo_model/todo_model.dart';
import 'package:todo/repositories/home_repo/home_repo.dart';
import 'package:todo/repositories/user_repo/user_repo.dart';

part 'home_viewmodel.freezed.dart';
part 'home_viewmodel_state.dart';

class HomeViewModel extends Cubit<HomeViewModelState> {
  HomeViewModel({
    required HomeRepo homeRepo,
    required UserRepo userRepo,
  })  : _homeRepo = homeRepo,
        _userRepo = userRepo,
        super(const _Initial());
  final HomeRepo _homeRepo;
  final UserRepo _userRepo;
  List<TodoModel> todos = [];

  Future<void> getAllTodos() async {
    emit(const _GetAllTodosLoading());
    var result = await _homeRepo.getTodos();
    result.when(
      success: (allTodos) {
        todos = allTodos;
        emit(_GetAllTodosSuccess(todos: todos));
      },
      failure: (failure) {
        emit(_GetAllTodosFailure(failure: failure));
      },
    );
  }

  Future<void> addTodo(TodoModel todo) async {
    emit(const _AddTodoLoading());
    var result = await _userRepo.addTodo(todo);
    result.when(
      success: (todo) {
        todos.add(todo);
        emit(_AddTodoSuccess(todo: todo));
      },
      failure: (failure) {
        emit(_AddTodoFailure(failure: failure));
      },
    );
  }

  Future<void> updateTodo(TodoModel todo) async {
    emit(const _UpdateTodoLoading());
    var result = await _userRepo.updateTodo(todo);
    result.when(
      success: (todo) {
        var index = todos.indexWhere((element) => element.id == todo.id);
        todos.removeAt(index);
        todos.insert(index, todo);
        emit(_UpdateTodoSuccess(todo: todo));
      },
      failure: (failure) {
        emit(_UpdateTodoFailure(failure: failure));
      },
    );
  }
}
