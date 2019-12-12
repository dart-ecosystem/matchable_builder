import 'package:analyzer/dart/element/element.dart';
import 'package:matchable_builder/src/filter/matcher.dart';
import 'package:matchable_builder/src/matchable_source.dart';

class ElementNameMatcher implements Matcher {
  Pattern namePattern;

  ElementNameMatcher(this.namePattern);

  @override
  bool test(MatchableSource source) {
    final element = source.element;
    if (namePattern is String) {
      return element.name == namePattern;
    }

    if (namePattern is RegExp) {
      return (namePattern as RegExp).hasMatch(element.name);
    }

    return false;
  }
}
