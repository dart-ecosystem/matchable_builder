import 'package:matchable_builder/matchable_builder.dart';
import 'package:matchable_builder/src/matcher/Matcher.dart';

class FileSchemaMatcher implements Matcher<BuildStep> {
  Pattern schemaPattern;

  FileSchemaMatcher(this.schemaPattern);

  @override
  bool test(BuildStep buildStep) {
    final schema = buildStep.inputId.uri.scheme;

    if (schemaPattern is String) {
      return schemaPattern == schema;
    }

    if (schemaPattern is RegExp) {
      return (schemaPattern as RegExp).hasMatch(schema);
    }

    return false;
  }
}
