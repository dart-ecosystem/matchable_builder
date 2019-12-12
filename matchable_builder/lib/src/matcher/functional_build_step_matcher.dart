import 'package:build/src/builder/build_step.dart';
import 'package:matchable_builder/src/matcher/matcher.dart';
import 'package:matchable_builder/src/matchable_source.dart';

class FunctionalBuildStepMatcher implements Matcher {
  BuildStepPredicate _predicate;

  FunctionalBuildStepMatcher(this._predicate);

  @override
  bool test(MatchableSource source) {
    return _predicate(source.buildStep);
  }
}

typedef bool BuildStepPredicate(BuildStep buildStep);
