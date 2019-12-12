import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/matcher.dart';
import 'package:matchable_builder/src/matchable_source.dart';

class ElementTypeMatcher<T> implements Matcher {
  @override
  bool test(MatchableSource source) {
    final element = source.element;
    return element is T;
  }
}
