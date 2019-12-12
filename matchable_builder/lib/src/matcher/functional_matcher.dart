import 'package:build/src/builder/build_step.dart';
import 'package:matchable_builder/src/matcher/matcher.dart';
import 'package:matchable_builder/src/matchable_source.dart';

class FunctionalMatcher implements Matcher {
  BuildStepPredicate _predicate;

  FunctionalMatcher(this._predicate);

  @override
  bool test(MatchableSource source) {
    return _predicate(source);
  }
}

typedef bool BuildStepPredicate(MatchableSource source);
