import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:build/src/builder/builder.dart';
import 'package:matchable_builder/matchable_builder.dart';
import 'package:matchable_builder/src/MatchableBuilder.dart';

class MyBuilder extends MatchableBuilder {
  Matcher<Element> get elementMatcher => Matcher.and([
        ElementTypeMatcher<ClassElement>(),
      ]);

  MyBuilder(BuilderOptions options) : super(options);

  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': ['.my.dart']
      };

  @override
  FutureOr<void> generate(LibraryElement library, List<Element> elements, BuildStep buildStep) {
    // TODO: implement generate
    return null;
  }
}
