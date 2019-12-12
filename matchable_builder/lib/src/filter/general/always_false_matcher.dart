import 'package:matchable_builder/src/filter/matcher.dart';

class AlwaysFalseMatcher implements Matcher<Object> {
  @override
  bool test(Object element) {
    return false;
  }
}
