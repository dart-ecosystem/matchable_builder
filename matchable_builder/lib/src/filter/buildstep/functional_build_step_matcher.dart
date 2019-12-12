import 'package:build/src/builder/build_step.dart';
import 'package:matchable_builder/src/filter/build_step_matcher.dart';

class FunctionalBuildStepMatcher implements BuildStepMatcher {
  BuildStepPredicate _predicate;

  FunctionalBuildStepMatcher(this._predicate);

  @override
  bool test(BuildStep buildStep) {
    return _predicate(buildStep);
  }
}

typedef bool BuildStepPredicate(BuildStep buildStep);
