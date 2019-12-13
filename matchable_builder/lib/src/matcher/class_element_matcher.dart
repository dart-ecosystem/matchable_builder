import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/matchable_source.dart';
import 'package:matchable_builder/src/matcher/matcher.dart';

class ClassElementMatcher implements Matcher {
  bool shouldBeAbstract;
  bool shouldBeConcrete;
  bool shouldBeEnum;
  bool shouldBePrivate;
  bool shouldBePublic;
  bool shouldBeMixin;
  bool shouldBeClass;

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
  bool test(MatchableSource source) {
    if (source.element is! ClassElement) {
      return false;
    }

    final ClassElement classElement = source.element;

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
