import 'package:matchable_builder/src/matcher/matcher.dart';
import 'package:matchable_builder/src/matchable_source.dart';

class PackageMatcher implements Matcher {
  Pattern packagePattern;

  PackageMatcher(this.packagePattern);

  @override
  bool test(MatchableSource source) {
    final buildStep = source.buildStep;
    final packageName = buildStep.inputId.uri.scheme;
    if (packagePattern is String) {
      return packagePattern == packageName;
    }

    if (packagePattern is RegExp) {
      return (packagePattern as RegExp).hasMatch(packageName);
    }

    return false;
  }
}
