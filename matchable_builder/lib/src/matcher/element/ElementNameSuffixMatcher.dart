import 'package:matchable_builder/src/matcher/element/ElementNameMatcher.dart';

class ElementNameSuffixMatcher extends ElementNameMatcher {
  ElementNameSuffixMatcher(String suffix) : super(RegExp('$suffix\$'));
}
