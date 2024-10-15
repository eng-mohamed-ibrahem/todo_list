
import 'package:todo/core/error/error.dart';
import 'package:todo/core/result_handler/result_handler.dart';
import 'package:todo/data_source/todo_data_source/todo_data_source.dart';
import 'package:todo/model/todo_model/todo_model.dart';
import 'package:todo/repositories/home_repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({required TodoDataSource todoDataSource})
      : _todoDataSource = todoDataSource;
  final TodoDataSource _todoDataSource;
  @override
  Future<ResultHandler<List<TodoModel>, Failure>> getTodos() async {
    try {
      return await _todoDataSource.getTodos();
    } catch (e) {
      return ResultHandler.failure(
        failure: CacheFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
