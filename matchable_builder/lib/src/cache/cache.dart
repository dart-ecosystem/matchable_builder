import 'dart:convert';

import 'package:dart_style/dart_style.dart';
import 'package:meta/meta.dart';

@immutable
abstract class Cache {
  Map<String, dynamic> toJson();

  @override
  String toString() {
    var rawString = json.encode(toJson());
    return DartFormatter().format(rawString);
  }
}
