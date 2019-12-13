import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:matchable_builder/matchable_builder.dart';

Builder demoBuilder(BuilderOptions ops) => DemoBuilder(ops);

class DemoBuilder extends MatchableBuilder {
  DemoBuilder(BuilderOptions options) : super(options);

  @override
  Matcher get matcher => Matcher.and([
        // every thing
        FilenameExtensionMatcher('.dart'),
        // exclude f
        ElementAnnotationMatcher<Deprecated>(),
        // exclude e
        ElementTypeMatcher<ClassElement>(),
        // exclude d
        Matcher.not(ClassElementFieldAnnotationMatcher<Deprecated>()),
        // exclude c
        Matcher.not(ClassElementMethodAnnotationMatcher<Deprecated>()),
        // exclude b
        Matcher.not(ClassElementConstructorAnnotationMatcher<Deprecated>()),
      ]);

  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': ['.demo.dart'],
      };

  @override
  FutureOr<void> generate(List<Element> elements, BuildStep buildStep) {
    print('${buildStep.inputId.path} | ${elements}');
    return null;
  }
}
