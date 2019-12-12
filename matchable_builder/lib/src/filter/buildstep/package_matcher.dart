import 'package:build/src/builder/build_step.dart';
import 'package:matchable_builder/matchable_builder.dart';

class PackageMatcher implements BuildStepMatcher {
  Pattern package;

  PackageMatcher(this.package);

  @override
  bool test(BuildStep buildStep) {
    final packageName = buildStep.inputId.uri.scheme;
    if (package is String) {
      return package == packageName;
    }

    if (package is RegExp) {
      (package as RegExp).hasMatch(packageName);
    }

    return false;
  }
}
