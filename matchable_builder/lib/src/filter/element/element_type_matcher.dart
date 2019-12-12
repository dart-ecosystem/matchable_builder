import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/element_matcher.dart';

class ElementTypeMatcher<T> implements ElementMatcher {
  @override
  bool test(Element element) {
    return element is T;
  }
}
