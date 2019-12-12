import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/element_matcher.dart';
import 'package:source_gen/source_gen.dart';

class ElementAnnotationMatcher<T> extends ElementMatcher {
  TypeChecker get annotationTypeChecker => TypeChecker.fromRuntime(T);

  @override
  bool test(Element element) {
    final annotation = annotationTypeChecker.firstAnnotationOf(element);
    return annotation != null;
  }
}
