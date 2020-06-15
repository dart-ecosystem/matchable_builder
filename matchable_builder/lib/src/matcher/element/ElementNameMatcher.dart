import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/matcher/Matcher.dart';

class ElementNameMatcher implements Matcher<Element> {
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
