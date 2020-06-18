import 'package:matchable_builder/matchable_builder.dart';
import 'package:matchable_builder/src/matcher/Matcher.dart';

class ClassElementMatcher implements Matcher<Element> {
  final bool shouldBeAbstract;
  final bool shouldBeConcrete;
  final bool shouldBeEnum;
  final bool shouldBePrivate;
  final bool shouldBePublic;
  final bool shouldBeMixin;
  final bool shouldBeClass;

  ClassElementMatcher({
    this.shouldBeAbstract = false,
    this.shouldBeConcrete = false,
    this.shouldBeEnum = false,
    this.shouldBePrivate = false,
    this.shouldBePublic = false,
    this.shouldBeMixin = false,
    this.shouldBeClass = false,
  });

  @override
  bool test(Element element) {
    if (element is! ClassElement) {
      return false;
    }

    final ClassElement classElement = element;

    // check abstract
    if (shouldBeAbstract && !classElement.isAbstract) {
      return false;
    }

    // check concrete
    if (shouldBeConcrete && classElement.isAbstract) {
      return false;
    }

    // check enum
    if (shouldBeEnum && !classElement.isEnum) {
      return false;
    }

    // check private
    if (shouldBePrivate && !classElement.isPrivate) {
      return false;
    }

    // check public
    if (shouldBePublic && !classElement.isPublic) {
      return false;
    }

    // check mixin
    if (shouldBeMixin && !classElement.isMixin) {
      return false;
    }

    // check class
    if (shouldBeClass && (classElement.isMixin || classElement.isEnum)) {
      return false;
    }

    return true;
  }
}
