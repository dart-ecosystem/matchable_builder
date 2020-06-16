import 'dart:convert';

import 'package:meta/meta.dart';

@immutable
abstract class Cache {
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return json.encode(toJson());
  }
}
