// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/data_source/todo_data_source/shared_pref_todo_data_source.dart';
import 'package:todo/model/todo_model/todo_model.dart';
import 'package:todo/repositories/home_repo/home_repo_impl.dart';
import 'package:todo/repositories/user_repo/user_repo_impl.dart';
import 'package:todo/view_model/home_viewmodel/home_viewmodel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  group('todo tests', () {
    late HomeViewModel homeCubit;

    setUp(() {
      homeCubit = HomeViewModel(
        homeRepo: HomeRepoImpl(todoDataSource: SharedPrefTodoDataSource()),
        userRepo: UserRepoImpl(todoDataSource: SharedPrefTodoDataSource()),
      );
    });
    blocTest<HomeViewModel, HomeViewModelState>(
      'emits [_AddTodoSuccess] when task is added',
      build: () => homeCubit,
      act: (cubit) =>
          cubit.addTodo(const TodoModel(id: '1', title: 'Test Todo')),
      expect: () => [
        const HomeViewModelState.addTodoLoading(),
        const HomeViewModelState.addTodoSuccess(
            todo: TodoModel(id: '1', title: 'Test Todo')),
      ],
    );
  });
}
