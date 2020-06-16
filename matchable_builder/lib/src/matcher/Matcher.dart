import 'package:matchable_builder/src/matcher/general/AndMatcher.dart';
import 'package:matchable_builder/src/matcher/general/NotMatcher.dart';
import 'package:matchable_builder/src/matcher/general/OrMatcher.dart';

abstract class Matcher<T> {
  bool test(T source);

  static Matcher<T> and<T>(List<Matcher<T>> matchers) {
    return AndMatcher<T>(matchers);
  }

  static Matcher<T> or<T>(List<Matcher<T>> matchers) {
    return OrMatcher<T>(matchers);
  }

  static Matcher<T> not<T>(Matcher<T> matcher) {
    return NotMatcher<T>(matcher);
  }

  static Matcher<T> nor<T>(List<Matcher<T>> matchers) {
    return NotMatcher<T>(OrMatcher<T>(matchers));
  }
}
