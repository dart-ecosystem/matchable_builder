import 'package:matchable_builder/src/matcher/element/ElementNameMatcher.dart';

class ElementNamePrefixMatcher extends ElementNameMatcher {
  ElementNamePrefixMatcher(String prefix) : super(RegExp('^$prefix'));
}
