import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/element_matcher.dart';

class ElementNameMatcher implements ElementMatcher {
  Pattern namePattern;

  ElementNameMatcher(this.namePattern);

  @override
  bool test(Element element) {
    if (namePattern is String) {
      return element.name == namePattern;
    }

    if (namePattern is RegExp) {
      return (namePattern as RegExp).hasMatch(element.name);
    }

    return false;
  }
}
