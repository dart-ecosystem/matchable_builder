import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/matchable_builder.dart';
import 'package:source_gen/source_gen.dart';

class ClassElementAssignableFromMatcher<T> implements Matcher<Element> {
  TypeChecker get _typeChecker => TypeChecker.fromRuntime(T);

  @override
  bool test(Element element) {
    if (element is! ClassElement) {
      return false;
    }

    return _typeChecker.isAssignableFrom(element);
  }
}
