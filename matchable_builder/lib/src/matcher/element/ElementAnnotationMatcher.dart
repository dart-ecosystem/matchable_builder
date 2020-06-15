import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/matcher/Matcher.dart';
import 'package:source_gen/source_gen.dart';

class ElementAnnotationMatcher<T> implements Matcher<Element> {
  TypeChecker get annotationTypeChecker => TypeChecker.fromRuntime(T);

  @override
  bool test(Element element) {
    return annotationTypeChecker.firstAnnotationOf(element) != null;
  }
}
