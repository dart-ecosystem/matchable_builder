import 'package:matchable_builder/src/matcher/matcher.dart';
import 'package:matchable_builder/src/matchable_source.dart';

class FileSchemaMatcher implements Matcher {
  Pattern schemaPattern;

  FileSchemaMatcher(this.schemaPattern);

  @override
  bool test(MatchableSource source) {
    final buildStep = source.buildStep;
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
