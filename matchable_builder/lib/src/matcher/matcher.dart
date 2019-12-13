import 'package:matchable_builder/src/matchable_source.dart';

abstract class Matcher {
  bool test(MatchableSource source);

  static T and<T extends Matcher>(List<T> matchers) {
    return AndMatcher<T>(matchers) as T;
  }

  static T or<T extends Matcher>(List<T> matchers) {
    return OrMatcher<T>(matchers) as T;
  }

  static T not<T extends Matcher>(T matcher) {
    return NotMatcher<T>(matcher) as T;
  }
}

class AndMatcher<T extends Matcher> implements Matcher {
  List<T> matchers;

  AndMatcher(this.matchers);

  @override
  bool test(MatchableSource source) {
    if (matchers == null) {
      return true;
    }
    return matchers.every((matcher) => matcher.test(source));
  }
}

class OrMatcher<T extends Matcher> implements Matcher {
  List<T> matchers;

  OrMatcher(this.matchers);

  @override
  bool test(MatchableSource source) {
    if (matchers == null) {
      return true;
    }
    return matchers.any((matcher) => matcher.test(source));
  }
}

class NotMatcher<T extends Matcher> implements Matcher {
  T matcher;

  NotMatcher(this.matcher);

  @override
  bool test(MatchableSource source) {
    return !matcher.test(source);
  }
}