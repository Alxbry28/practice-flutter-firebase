import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String content;
  String todoId;
  DateTime dateCreated;
  bool done;

  TodoModel(
    this.content,
    this.todoId,
    this.dateCreated,
    this.done,
  );

  TodoModel copyWith({
    String? content,
    String? todoId,
    DateTime? dateCreated,
    bool? done,
  }) {
    return TodoModel(
      content ?? this.content,
      todoId ?? this.todoId,
      dateCreated ?? this.dateCreated,
      done ?? this.done,
    );
  }

  factory TodoModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return TodoModel(
      documentSnapshot.id,
      documentSnapshot.get("content"),
      documentSnapshot.get("dateCreated"),
      documentSnapshot.get("done"),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'todoId': todoId,
      'dateCreated': dateCreated.millisecondsSinceEpoch,
      'done': done,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      map['content'] ?? '',
      map['todoId'] ?? '',
      DateTime.fromMillisecondsSinceEpoch(map['dateCreated']),
      map['done'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TodoModel(content: $content, todoId: $todoId, dateCreated: $dateCreated, done: $done)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoModel &&
        other.content == content &&
        other.todoId == todoId &&
        other.dateCreated == dateCreated &&
        other.done == done;
  }

  @override
  int get hashCode {
    return content.hashCode ^
        todoId.hashCode ^
        dateCreated.hashCode ^
        done.hashCode;
  }
}
