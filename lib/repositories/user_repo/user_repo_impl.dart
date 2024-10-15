
import 'package:todo/core/error/error.dart';
import 'package:todo/core/result_handler/result_handler.dart';
import 'package:todo/data_source/todo_data_source/todo_data_source.dart';
import 'package:todo/model/todo_model/todo_model.dart';
import 'package:todo/repositories/user_repo/user_repo.dart';

class UserRepoImpl implements UserRepo {
  UserRepoImpl({required TodoDataSource todoDataSource})
      : _todoDataSource = todoDataSource;
  final TodoDataSource _todoDataSource;

  @override
  Future<ResultHandler<TodoModel, Failure>> addTodo(TodoModel todo) async {
    try {
      await _todoDataSource.addTodo(todo);
      return ResultHandler.success(data: todo);
    } catch (e) {
      return ResultHandler.failure(
        failure: CacheFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<ResultHandler<TodoModel, Failure>> deleteTodo(TodoModel todo) {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<TodoModel, Failure>> updateTodo(TodoModel todo) {
    throw UnimplementedError();
  }
}
