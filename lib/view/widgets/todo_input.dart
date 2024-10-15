import 'package:flutter/material.dart';

class TodoInput extends StatelessWidget {
  const TodoInput({
    super.key,
    this.controller,
    this.onChanged,
  }) : assert(controller != null || onChanged != null);
  final TextEditingController? controller;
  final Function(String text)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: 'todo',
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      maxLines: 2,
    );
  }
}
