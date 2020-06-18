import 'package:matchable_builder/matchable_builder.dart';
import 'package:matchable_builder/src/matcher/Matcher.dart';

class PackageNameMatcher implements Matcher<BuildStep> {
  final Pattern packagePattern;

  PackageNameMatcher(this.packagePattern);

  @override
  bool test(BuildStep buildStep) {
    final packageName = buildStep.inputId.package;

    if (packagePattern is String) {
      return packagePattern == packageName;
    }

    if (packagePattern is RegExp) {
      return (packagePattern as RegExp).hasMatch(packageName);
    }

    return false;
  }
}
