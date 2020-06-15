import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/matcher/Matcher.dart';

class ElementTypeMatcher<T> implements Matcher<Element> {
  @override
  bool test(Element element) {
    return element is T;
  }
}
