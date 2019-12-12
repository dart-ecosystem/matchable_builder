import 'package:matchable_builder/src/matcher/element_name_matcher.dart';

class ElementNamePrefixMatcher extends ElementNameMatcher {
  ElementNamePrefixMatcher(String prefix) : super(RegExp('^$prefix'));
}
