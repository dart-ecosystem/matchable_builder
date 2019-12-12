import 'package:matchable_builder/src/filter/element_name_matcher.dart';

class ElementNamePrefixMatcher extends ElementNameMatcher {
  ElementNamePrefixMatcher(String prefix) : super(RegExp('^$prefix'));
}
