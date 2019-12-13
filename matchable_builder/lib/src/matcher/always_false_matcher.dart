import 'package:matchable_builder/src/matcher/matcher.dart';
import 'package:matchable_builder/src/matchable_source.dart';

class AlwaysFalseMatcher implements Matcher {
  @override
  bool test(MatchableSource element) {
    return false;
  }
}