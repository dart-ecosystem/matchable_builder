import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/element/element_name_matcher.dart';
import 'package:matchable_builder/src/filter/element_matcher.dart';

class ElementNamePrefixMatcher extends ElementNameMatcher {
  ElementNamePrefixMatcher(String prefix) : super(RegExp('^$prefix'));
}
