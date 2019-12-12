import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/matcher.dart';

abstract class ElementMatcher implements Matcher<Element> {
  @override
  bool test(Element element);
}
