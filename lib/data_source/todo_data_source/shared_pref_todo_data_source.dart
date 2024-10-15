import 'package:todo/core/constants/cache_constants.dart';
import 'package:todo/core/error/error.dart';
import 'package:todo/core/result_handler/result_handler.dart';
import 'package:todo/core/services/cache/shared_pref_service.dart';
import 'package:todo/data_source/todo_data_source/todo_data_source.dart';
import 'package:todo/model/todo_model/todo_model.dart';

class SharedPrefTodoDataSource implements TodoDataSource {
  @override
  Future<ResultHandler<TodoModel, Failure>> addTodo(TodoModel todo) async {
    try {
      await SharedPrefService().saveValueInList(
          listKey: CacheConstants.todos, value: todo.asString());

      return ResultHandler.success(data: todo);
    } on FormatException catch (e) {
      return ResultHandler.failure(
        failure: CacheFailure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<ResultHandler<TodoModel, Failure>> deleteTodo(TodoModel todo) {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<List<TodoModel>, Failure>> getTodos() async {
    try {
      final todos = await SharedPrefService().getList(
        listKey: CacheConstants.todos,
      );
      return ResultHandler.success(
        data: todos.map((e) => TodoModel.fromString(e)).toList(),
      );
    } on FormatException catch (e) {
      return ResultHandler.failure(
        failure: CacheFailure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<ResultHandler<TodoModel, Failure>> updateTodo(TodoModel todo) async {
    try {
      final todos = await SharedPrefService().getList(
        listKey: CacheConstants.todos,
      );
      await SharedPrefService().saveList(
        listKey: CacheConstants.todos,
        list: todos
            .map((e) =>
                TodoModel.fromString(e).id == todo.id ? todo.asString() : e)
            .toList(),
      );
      return ResultHandler.success(data: todo);
    } on FormatException catch (e) {
      return ResultHandler.failure(
        failure: CacheFailure(
          message: e.message,
        ),
      );
    }
  }
}
