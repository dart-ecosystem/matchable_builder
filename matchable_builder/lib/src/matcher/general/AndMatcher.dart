import 'package:matchable_builder/src/matcher/Matcher.dart';

class AndMatcher<T> implements Matcher<T> {
  List<Matcher<T>> matchers;

  AndMatcher(this.matchers);

  @override
  bool test(T source) {
    if (matchers == null) {
      return true;
    }
    return matchers.every((matcher) => matcher.test(source));
  }
}
