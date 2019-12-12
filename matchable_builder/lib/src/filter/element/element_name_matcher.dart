import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/element_matcher.dart';

class ElementNameMatcher implements ElementMatcher {
  RegExp nameRegExp;

  ElementNameMatcher(this.nameRegExp);

  @override
  bool test(Element element) {
    return nameRegExp.hasMatch(element.name);
  }
}
