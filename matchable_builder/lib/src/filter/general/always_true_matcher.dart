import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/element_matcher.dart';
import 'package:matchable_builder/src/filter/library_matcher.dart';
import 'package:matchable_builder/src/filter/build_step_matcher.dart';

class AlwaysTrueMatcher implements ElementMatcher, LibraryMatcher, BuildStepMatcher {
  @override
  bool test(Object element) {
    return true;
  }
}
