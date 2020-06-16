import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/matchable_builder.dart';
import 'package:source_gen/source_gen.dart';

class ClassElementSuperTypeMatcher<T> implements Matcher<Element> {
  TypeChecker get _subtypeChecker => TypeChecker.fromRuntime(T);

  final bool direct;

  ClassElementSuperTypeMatcher({
    this.direct = false,
  });

  bool testNonDirect(Element element) {
    if (element is! ClassElement) {
      return false;
    }
    final ClassElement classElement = element;
    return _subtypeChecker.isSuperOf(classElement);
  }

  bool testDirect(Element element) {
    if (element is! ClassElement) {
      return false;
    }

    final ClassElement classElement = element;

    final superType = classElement.supertype;

    if (superType == null) {
      return false;
    }
    return _subtypeChecker.isExactlyType(superType);
  }

  @override
  bool test(Element element) {
    if (direct) {
      return testDirect(element);
    }

    return testNonDirect(element);
  }
}
