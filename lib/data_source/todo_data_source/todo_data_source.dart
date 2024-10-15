
import 'package:todo/core/error/error.dart';
import 'package:todo/core/result_handler/result_handler.dart';
import 'package:todo/model/todo_model/todo_model.dart';

abstract class TodoDataSource {
  Future<ResultHandler<List<TodoModel>, Failure>> getTodos();

  /// add todo and return the added todo
  Future<ResultHandler<TodoModel, Failure>> addTodo(TodoModel todo);

  /// update the exit todo and return the updated todo
  Future<ResultHandler<TodoModel, Failure>> updateTodo(TodoModel todo);

  /// delete the todo and return the deleted todo
  Future<ResultHandler<TodoModel, Failure>> deleteTodo(TodoModel todo);
}
