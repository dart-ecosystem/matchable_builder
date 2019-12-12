import 'package:build/src/builder/build_step.dart';
import 'package:matchable_builder/src/filter/build_step_matcher.dart';

class FilenameMatcher implements BuildStepMatcher {
  RegExp fileNameRegExp;

  FilenameMatcher(this.fileNameRegExp);

  @override
  bool test(covariant BuildStep element) {
    final filename = element.inputId.uri.pathSegments.last;
    return fileNameRegExp.hasMatch(filename);
  }
}
