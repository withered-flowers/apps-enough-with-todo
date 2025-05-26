import 'package:flutter/material.dart';
import 'package:enough_with_todo/utils/utils.dart';
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final TaskCategories category;
  final bool isCompleted;

  Task({
    required this.title,
    required this.note,
    required this.time,
    required this.date,
    required this.category,
    required this.isCompleted,
    this.id,
  });

  @override
  List<Object?> get props => [
    id!,
    title,
    note,
    time,
    date,
    category,
    isCompleted,
  ];

  Map<String, dynamic> toJson() {
    return {
      DbKeys.idColumn: id,
      DbKeys.titleColumn: title,
      DbKeys.noteColumn: note,
      DbKeys.timeColumn: time,
      DbKeys.dateColumn: date,
      DbKeys.categoryColumn: category.name,
      DbKeys.isCompletedColumn: isCompleted ? 1 : 0,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json[DbKeys.idColumn],
      title: json[DbKeys.titleColumn],
      note: json[DbKeys.noteColumn],
      time: json[DbKeys.timeColumn],
      date: json[DbKeys.dateColumn],
      category: TaskCategories.stringToCategory(json[DbKeys.categoryColumn]),
      isCompleted: json[DbKeys.isCompletedColumn],
    );
  }

  Task copyWith({
    ValueGetter<int?>? id,
    String? title,
    String? note,
    String? time,
    String? date,
    TaskCategories? category,
    bool? isCompleted,
  }) {
    return Task(
      id: id != null ? id() : this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      time: time ?? this.time,
      date: date ?? this.date,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
