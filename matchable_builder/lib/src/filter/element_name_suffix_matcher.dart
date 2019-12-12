import 'package:matchable_builder/src/filter/element_name_matcher.dart';

class ElementNameSuffixMatcher extends ElementNameMatcher {
  ElementNameSuffixMatcher(String suffix) : super(RegExp('$suffix\$'));
}
