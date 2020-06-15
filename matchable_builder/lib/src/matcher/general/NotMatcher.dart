import 'package:matchable_builder/src/matcher/Matcher.dart';

class NotMatcher<T> implements Matcher<T> {
  Matcher<T> matcher;

  NotMatcher(this.matcher);

  @override
  bool test(T source) {
    return !matcher.test(source);
  }
}
