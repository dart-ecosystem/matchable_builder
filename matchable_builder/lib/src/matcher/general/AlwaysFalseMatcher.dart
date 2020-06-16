import 'package:matchable_builder/src/matcher/Matcher.dart';

class AlwaysFalseMatcher implements Matcher<Object> {
  @override
  bool test(Object ignored) {
    return false;
  }
}
