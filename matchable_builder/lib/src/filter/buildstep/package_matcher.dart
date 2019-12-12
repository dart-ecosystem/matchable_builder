import 'package:build/src/builder/build_step.dart';
import 'package:matchable_builder/matchable_builder.dart';

class PackageMatcher implements BuildStepMatcher {
  Pattern packageExpression;

  PackageMatcher(this.packageExpression);

  @override
  bool test(BuildStep buildStep) {
    final packageName = buildStep.inputId.uri.scheme;
    if (packageExpression is String) {
      return packageExpression == packageName;
    } else if (packageExpression is RegExp) {
      (packageExpression as RegExp).hasMatch(packageName);
    }

    throw Exception('packageExpression should be either String or RegExp');
  }
}
