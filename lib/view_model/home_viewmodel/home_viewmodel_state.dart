part of 'home_viewmodel.dart';

@freezed
class HomeViewModelState with _$HomeViewModelState {
  const factory HomeViewModelState.initial() = _Initial;

  /// get all todos
  const factory HomeViewModelState.getAllTodosLoading() = _GetAllTodosLoading;
  const factory HomeViewModelState.getAllTodosSuccess(
      {required List<TodoModel> todos}) = _GetAllTodosSuccess;
  const factory HomeViewModelState.getAllTodosFailure(
      {required Failure failure}) = _GetAllTodosFailure;

  /// add todo
  const factory HomeViewModelState.addTodoLoading() = _AddTodoLoading;
  const factory HomeViewModelState.addTodoSuccess({required TodoModel todo}) =
      _AddTodoSuccess;
  const factory HomeViewModelState.addTodoFailure({required Failure failure}) =
      _AddTodoFailure;

  /// update todo
  const factory HomeViewModelState.updateTodoLoading() = _UpdateTodoLoading;
  const factory HomeViewModelState.updateTodoSuccess(
      {required TodoModel todo}) = _UpdateTodoSuccess;
  const factory HomeViewModelState.updateTodoFailure(
      {required Failure failure}) = _UpdateTodoFailure;

  /// delete todo
  const factory HomeViewModelState.deleteTodoLoading() = _DeleteTodoLoading;
  const factory HomeViewModelState.deleteTodoSuccess(
      {required TodoModel todo}) = _DeleteTodoSuccess;
  const factory HomeViewModelState.deleteTodoFailure(
      {required Failure failure}) = _DeleteTodoFailure;
}
