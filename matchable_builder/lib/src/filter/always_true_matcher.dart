import 'package:matchable_builder/src/filter/matcher.dart';
import 'package:matchable_builder/src/matchable_source.dart';

class AlwaysTrueMatcher implements Matcher {
  @override
  bool test(MatchableSource element) {
    return true;
  }
}
