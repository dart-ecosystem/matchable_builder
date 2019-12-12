import 'package:build/src/builder/build_step.dart';
import 'package:matchable_builder/src/matcher/matcher.dart';
import 'package:matchable_builder/src/matchable_source.dart';

class FilenameMatcher implements Matcher {
  Pattern filenamePattern;

  FilenameMatcher(this.filenamePattern);

  @override
  bool test(MatchableSource source) {
    final buildStep = source.buildStep;
    final filename = buildStep.inputId.uri.pathSegments.last;
    if (filenamePattern is String) {
      return filenamePattern == filename;
    }

    if (filenamePattern is RegExp) {
      return (filenamePattern as RegExp).hasMatch(filename);
    }

    return false;
  }
}
