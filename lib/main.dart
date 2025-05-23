import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enough_with_todo/app/todo_app.dart';

void main() {
  runApp(ProviderScope(child: const TodoApp()));
}
