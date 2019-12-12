import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/element/element_name_matcher.dart';
import 'package:matchable_builder/src/filter/element_matcher.dart';

class ElementNameSuffixMatcher extends ElementNameMatcher {
  ElementNameSuffixMatcher(String suffix) : super(RegExp('$suffix\$'));

  @override
  bool test(Element element) {
    return nameRegExp.hasMatch(element.name);
  }
}
