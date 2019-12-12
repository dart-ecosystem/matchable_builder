import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/element_matcher.dart';

class ElementNameMatcher implements ElementMatcher {
  Pattern name;

  ElementNameMatcher(this.name);

  @override
  bool test(Element element) {
    if (name is String) {
      return element.name == name;
    }

    if (name is RegExp) {
      return (name as RegExp).hasMatch(element.name);
    }

    return false;
  }
}
