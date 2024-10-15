import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/config/navigation/roues.dart';
import 'package:todo/data_source/todo_data_source/shared_pref_todo_data_source.dart';
import 'package:todo/repositories/home_repo/home_repo_impl.dart';
import 'package:todo/repositories/user_repo/user_repo_impl.dart';
import 'package:todo/view/views/home.dart';
import 'package:todo/view/views/todo.dart';
import 'package:todo/view_model/home_viewmodel/home_viewmodel.dart';

class AppNavigation {
  static GoRouter routerConfig = GoRouter(
    initialLocation: Routes.home.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.home.path,
        builder: (context, state) {
          return BlocProvider<HomeViewModel>(
            lazy: false,
            create: (context) => HomeViewModel(
              homeRepo:
                  HomeRepoImpl(todoDataSource: SharedPrefTodoDataSource()),
              userRepo:
                  UserRepoImpl(todoDataSource: SharedPrefTodoDataSource()),
            )..getAllTodos(),
            child: const Home(),
          );
        },
        routes: [
          GoRoute(
            path: Routes.todo.path,
            builder: (context, state) {
              return const Todo();
            },
          ),
        ],
      ),
    ],
  );
}
