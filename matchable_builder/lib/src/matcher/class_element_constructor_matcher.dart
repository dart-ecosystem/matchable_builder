import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/matchable_source.dart';
import 'package:matchable_builder/src/matcher/matcher.dart';

class ClassElementConstructorMatcher implements Matcher {
  bool shouldHaveDefault;
  bool shouldHaveNoneDefault;
  bool shouldHavePublic;
  bool shouldHavePrivate;
  bool shouldAllPublic;
  bool shouldAllPrivate;
  int shouldHaveLength;

  ClassElementConstructorMatcher({
    this.shouldHaveDefault = false,
    this.shouldHaveNoneDefault = false,
    this.shouldHavePublic = false,
    this.shouldHavePrivate = false,
    this.shouldAllPublic = false,
    this.shouldAllPrivate = false,
    this.shouldHaveLength = -1,
  });

  @override
  bool test(MatchableSource source) {
    if (source.element is! ClassElement) {
      return false;
    }

    final ClassElement classElement = source.element;
    final constructors = classElement.constructors;

    // check shouldHaveDefault
    if (shouldHaveDefault && !constructors.any((c) => c.isDefaultConstructor)) {
      return false;
    }

    // check shouldHaveNoneDefault
    if (shouldHaveNoneDefault && constructors.any((c) => c.isDefaultConstructor)) {
      return false;
    }

    // check shouldHavePublic
    if (shouldHavePublic && !constructors.any((c) => c.isPublic)) {
      return false;
    }

    // check shouldHavePrivate
    if (shouldHavePrivate && !constructors.any((c) => c.isPrivate)) {
      return false;
    }

    // check shouldAllPublic
    if (shouldAllPublic && !constructors.every((c) => c.isPublic)) {
      return false;
    }

    // check shouldAllPrivate
    if (shouldAllPrivate && !constructors.every((c) => c.isPrivate)) {
      return false;
    }

    // check shouldHaveLength
    if (shouldHaveLength != -1 && constructors.length != shouldHaveLength) {
      return false;
    }

    return true;
  }
}
