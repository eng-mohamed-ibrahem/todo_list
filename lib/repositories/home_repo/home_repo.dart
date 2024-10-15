
import 'package:todo/core/error/error.dart';
import 'package:todo/core/result_handler/result_handler.dart';
import 'package:todo/model/todo_model/todo_model.dart';

abstract class HomeRepo {
  Future<ResultHandler<List<TodoModel>, Failure>> getTodos();
}
