import 'package:meta/meta.dart';
import 'package:matchable_builder/matchable_builder.dart';

class DemoCache extends Cache {
  final List<String> classNames;

  DemoCache({
    @required this.classNames,
  });

  static Cache fromJson(Map<String, Object> json) {
    return DemoCache(
      classNames: List<String>.from(json["classNames"]),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "classNames": classNames,
    };
  }
}
