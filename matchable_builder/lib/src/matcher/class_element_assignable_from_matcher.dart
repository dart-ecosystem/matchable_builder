import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:matchable_builder/matchable_builder.dart';
import 'package:matchable_builder/src/matchable_source.dart';
import 'package:source_gen/source_gen.dart';

class ClassElementAssignableFromMatcher<T> implements Matcher {
  TypeChecker get _typeChecker => TypeChecker.fromRuntime(T);

  @override
  bool test(MatchableSource source) {
    if (source.element is! ClassElement) {
      return false;
    }

    return _typeChecker.isAssignableFrom(source.element);
  }
}
