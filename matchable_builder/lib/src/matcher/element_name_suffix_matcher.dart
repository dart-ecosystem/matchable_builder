import 'package:matchable_builder/src/matcher/element_name_matcher.dart';

class ElementNameSuffixMatcher extends ElementNameMatcher {
  ElementNameSuffixMatcher(String suffix) : super(RegExp('$suffix\$'));
}
