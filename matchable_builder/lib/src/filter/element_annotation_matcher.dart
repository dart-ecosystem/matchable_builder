import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/matcher.dart';
import 'package:matchable_builder/src/matchable_source.dart';
import 'package:source_gen/source_gen.dart';

class ElementAnnotationMatcher<T> extends Matcher {
  TypeChecker get annotationTypeChecker => TypeChecker.fromRuntime(T);

  @override
  bool test(MatchableSource source) {
    final element = source.element;
    final annotation = annotationTypeChecker.firstAnnotationOf(element);
    return annotation != null;
  }
}
