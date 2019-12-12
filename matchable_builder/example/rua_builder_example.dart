import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:matchable_builder/matchable_builder.dart';
import 'package:matchable_builder/src/matchable_builder.dart';

class MyBuilder extends MatchableBuilder {
  @override
  ElementMatcher elementMatcher = Matcher.and([
    ElementTypeMatcher<ClassElement>(),
  ]);

  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': ['.my.dart']
      };

  @override
  FutureOr<void> generate(List<Element> elements, BuildStep buildStep) {
    // your logic code here
    return null;
  }
}
