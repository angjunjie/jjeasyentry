import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Location {
  final int id;
  final String title;

  Location({this.id, this.title});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  @override
  String toString() {
    return 'id: $id, title: $title';
  }

  String getTitle() {
    return '$title';
  }
}
// yolo
