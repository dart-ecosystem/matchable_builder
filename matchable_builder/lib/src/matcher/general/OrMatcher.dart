import 'package:matchable_builder/src/matcher/Matcher.dart';

class OrMatcher<T> implements Matcher<T> {
  List<Matcher<T>> matchers;

  OrMatcher(this.matchers);

  @override
  bool test(T source) {
    if (matchers == null) {
      return true;
    }
    return matchers.any((matcher) => matcher.test(source));
  }
}
