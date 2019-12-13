import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/matchable_builder.dart';
import 'package:matchable_builder/src/matchable_source.dart';
import 'package:source_gen/source_gen.dart';

class ClassElementMethodAnnotationMatcher<T> extends Matcher {
  TypeChecker get _annotationTypeChecker => TypeChecker.fromRuntime(T);

  @override
  bool test(MatchableSource source) {
    if (source.element is! ClassElement) {
      return false;
    }

    ClassElement classElement = source.element;
    return classElement.methods.any(_annotationTypeChecker.hasAnnotationOf);
  }
}
