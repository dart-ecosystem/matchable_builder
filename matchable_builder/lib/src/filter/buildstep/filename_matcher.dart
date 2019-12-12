import 'package:build/src/builder/build_step.dart';
import 'package:matchable_builder/src/filter/build_step_matcher.dart';

class FilenameMatcher implements BuildStepMatcher {
  Pattern filenamePattern;

  FilenameMatcher(this.filenamePattern);

  @override
  bool test(covariant BuildStep element) {
    final filename = element.inputId.uri.pathSegments.last;
    if (filenamePattern is String) {
      return filenamePattern == filename;
    }

    if (filenamePattern is RegExp) {
      (filenamePattern as RegExp).hasMatch(filename);
    }

    return false;
  }
}
