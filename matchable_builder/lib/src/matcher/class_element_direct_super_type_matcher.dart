import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:matchable_builder/matchable_builder.dart';
import 'package:matchable_builder/src/matchable_source.dart';
import 'package:source_gen/source_gen.dart';

class ClassElementDirectSuperTypeMatcher<T> implements Matcher {
  TypeChecker get _subtypeChecker => TypeChecker.fromRuntime(T);

  @override
  bool test(MatchableSource source) {
    if (source.element is! ClassElement) {
      return false;
    }

    final ClassElement classElement = source.element;

    final superType = classElement.supertype;

    if (superType == null) {
      return false;
    }
    return _subtypeChecker.isExactlyType(superType);
  }
}
