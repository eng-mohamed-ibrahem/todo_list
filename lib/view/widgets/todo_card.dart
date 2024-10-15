import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/model/todo_model/todo_model.dart';
import 'package:todo/view_model/home_viewmodel/home_viewmodel.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({super.key, required this.todoModel});
  final TodoModel todoModel;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: widget.todoModel.isCompleted ? Colors.green : Colors.grey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Row(
          children: [
            Checkbox(
              value: widget.todoModel.isCompleted,
              onChanged: (value) {
                context
                    .read<HomeViewModel>()
                    .updateTodo(widget.todoModel.copyWith(isCompleted: value!));
              },
            ),
            Expanded(child: Text(widget.todoModel.title)),
          ],
        ),
      ),
    );
  }
}
