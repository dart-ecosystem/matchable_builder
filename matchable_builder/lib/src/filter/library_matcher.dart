import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/matcher.dart';

abstract class LibraryMatcher implements Matcher<LibraryElement> {
  @override
  bool test(LibraryElement element);
}
