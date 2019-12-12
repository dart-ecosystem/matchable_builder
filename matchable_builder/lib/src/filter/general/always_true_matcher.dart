import 'package:matchable_builder/src/filter/matcher.dart';

class AlwaysTrueMatcher implements Matcher<Object> {
  @override
  bool test(Object element) {
    return true;
  }
}
