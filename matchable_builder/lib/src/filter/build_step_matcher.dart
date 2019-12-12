import 'package:build/build.dart';
import 'package:matchable_builder/src/filter/matcher.dart';

abstract class BuildStepMatcher implements Matcher<BuildStep> {
  @override
  bool test(BuildStep buildStep);
}
