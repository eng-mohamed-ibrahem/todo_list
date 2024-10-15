import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:todo/core/methods/helper_methods.dart';
import 'package:todo/model/todo_model/todo_model.dart';
import 'package:todo/view/widgets/todo_card.dart';
import 'package:todo/view/widgets/todo_input.dart';
import 'package:todo/view_model/home_viewmodel/home_viewmodel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: BlocConsumer<HomeViewModel, HomeViewModelState>(
        listener: (context, state) {
          state.whenOrNull(
            updateTodoFailure: (failure) {
              showSnackBar(context, "Oops! Couldn't update todo");
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            getAllTodosLoading: () {
              return Skeletonizer(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const TodoCard(
                      todoModel: TodoModel(
                        id: "id",
                        title: "title",
                      ),
                    );
                  },
                ),
              );
            },
            getAllTodosFailure: (failure) {
              return Center(
                child: Column(
                  children: [
                    Text(failure.message),
                    SizedBox(height: 10.h),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<HomeViewModel>().getAllTodos();
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              );
            },
            orElse: () {
              var todos = context.watch<HomeViewModel>().todos;
              return ListView.builder(
                itemCount: todos.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return TodoCard(
                    todoModel: todos[index],
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _addTodo(context);
        },
        label: const Text('Add Todo'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _addTodo(BuildContext context) {
    String? todoTitle;
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      clipBehavior: Clip.antiAlias,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      builder: (context) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            children: [
              TodoInput(
                onChanged: (text) {
                  todoTitle = text;
                },
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  if (todoTitle != null) {
                    var todoModel = TodoModel(
                      id: UniqueKey().toString(),
                      title: todoTitle!,
                    );
                    context.read<HomeViewModel>().addTodo(todoModel);
                  } else {
                    showSnackBar(context, 'Please enter todo title');
                  }
                  Navigator.pop(context);
                },
                child: const Text('Add Todo'),
              ),
            ],
          ),
        );
      },
    );
  }
}
