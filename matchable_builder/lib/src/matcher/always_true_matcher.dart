import 'package:matchable_builder/src/matcher/matcher.dart';
import 'package:matchable_builder/src/matchable_source.dart';

class AlwaysTrueMatcher implements Matcher {
  @override
  bool test(MatchableSource source) {
    return true;
  }
}
