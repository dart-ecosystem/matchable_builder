import 'package:build/src/builder/build_step.dart';
import 'package:matchable_builder/matchable_builder.dart';

class PackageMatcher implements BuildStepMatcher {
  Pattern packagePattern;

  PackageMatcher(this.packagePattern);

  @override
  bool test(BuildStep buildStep) {
    final packageName = buildStep.inputId.uri.scheme;
    if (packagePattern is String) {
      return packagePattern == packageName;
    }

    if (packagePattern is RegExp) {
      (packagePattern as RegExp).hasMatch(packageName);
    }

    return false;
  }
}
