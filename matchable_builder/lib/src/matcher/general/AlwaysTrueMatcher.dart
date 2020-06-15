import 'package:matchable_builder/matchable_builder.dart';
import 'package:matchable_builder/src/matcher/Matcher.dart';

class AlwaysTrueMatcher<T> implements Matcher<T> {
  @override
  bool test(Object ignored) {
    return true;
  }
}
