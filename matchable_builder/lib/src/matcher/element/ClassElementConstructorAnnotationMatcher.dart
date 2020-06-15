import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/matchable_builder.dart';
import 'package:matchable_builder/src/matchable_source.dart';
import 'package:source_gen/source_gen.dart';

class ClassElementConstructorAnnotationMatcher<T> implements Matcher<Element> {
  TypeChecker get _annotationTypeChecker => TypeChecker.fromRuntime(T);

  @override
  bool test(Element element) {
    if (element is! ClassElement) {
      return false;
    }

    ClassElement classElement = element;
    return classElement.constructors.any(_annotationTypeChecker.hasAnnotationOf);
  }
}
