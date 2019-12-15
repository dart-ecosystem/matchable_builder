import 'dart:async';

import 'package:build/build.dart';
import 'package:demo/src/demo_cache.dart';
import 'package:matchable_builder/matchable_builder.dart';

class DemoCollector extends MatchableBuilder {
  DemoCollector(BuilderOptions options) : super(options);

  @override
  Matcher get matcher => Matcher.and([
        // every thing
        FilenameExtensionMatcher('.dart'),
        ClassElementSuperTypeMatcher<Object>(),
        // exclude builder.dart
        ClassElementDirectSuperTypeMatcher<Object>(),
        // exclude file outside lib/
        FileSchemaMatcher('package'),
        // exclude j
        ClassElementMatcher(
          shouldBeConcrete: true,
          shouldBeClass: true,
          shouldBePublic: true,
        ),
        // exclude i
        Matcher.not(ClassElementAssignableFromMatcher<Exception>()),
        // exclude h
        Matcher.not(ClassElementInterfaceMatcher<Exception>()),
        // exclude g
        FilenameExactExtensionMatcher('.dart'),
        // exclude f
        Matcher.not(ElementAnnotationMatcher<Deprecated>()),
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
        '.dart': ['.demo.json'],
      };

  @override
  FutureOr<void> generate(List<Element> elements, BuildStep buildStep) async {
    print('${buildStep.inputId.path} | ${elements}');
    final cacheHelper = CacheHelper(buildStep);
    final cache = DemoCache(classNames: elements.map((e) => e.name).toList());
    await cacheHelper.writeAssetToExtension(".demo.json", cache);
  }
}
