import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/element_matcher.dart';
import 'package:matchable_builder/src/filter/library_matcher.dart';

class AlwaysFalseMatcher implements ElementMatcher, LibraryMatcher {
  @override
  bool test(Object element) {
    return false;
  }
}
