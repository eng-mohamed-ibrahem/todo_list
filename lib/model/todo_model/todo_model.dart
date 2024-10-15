import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class TodoModel with _$TodoModel {
  const TodoModel._();
  const factory TodoModel({
    required String id,
    required String title,
    @JsonKey(name: 'is_completed') @Default(false) bool isCompleted,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  String asString() => json.encode(toJson());

  factory TodoModel.fromString(String source) =>
      TodoModel.fromJson(json.decode(source) as Map<String, dynamic>);
}
