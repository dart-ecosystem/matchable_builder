import 'package:matchable_builder/matchable_builder.dart';
import 'package:matchable_builder/src/matcher/Matcher.dart';

class PackageMatcher implements Matcher<BuildStep> {
  final bool shouldBePrivate;
  final bool shouldBePublic;

  PackageMatcher({
    this.shouldBePrivate,
    this.shouldBePublic,
  });

  @override
  bool test(BuildStep buildStep) {
    final packageName = buildStep.inputId.package;

    if (shouldBePrivate && !packageName.startsWith('_')) {
      return false;
    }

    if (shouldBePublic && packageName.startsWith('_')) {
      return false;
    }

    return true;
  }
}
