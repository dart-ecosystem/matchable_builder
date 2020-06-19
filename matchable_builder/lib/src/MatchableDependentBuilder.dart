import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:build/src/builder/builder.dart';
import 'package:matchable_builder/src/AbstractMatchableBuilder.dart';
import 'package:matchable_builder/src/util/BuildStepUtil.dart';

abstract class MatchableDependentBuilder extends AbstractMatchableBuilder {
  MatchableDependentBuilder(BuilderOptions options) : super(options);

  @override
  Future<void> build(BuildStep buildStep) async {
    // continue when file passes file matcher
    if (!fileMatcher.test(buildStep)) {
      return;
    }

    // prepare
    final library = await BuildStepUtil.getLibrary(buildStep);

    // abort if library can't be resolved
    if (library == null) {
      return;
    }

    await runGenerate(library, null, buildStep);
  }

  @override
  Future<void> runGenerate(
    LibraryElement library,
    List<Element> _,
    BuildStep buildStep,
  ) async {
    final libraryElements = <LibraryElement, List<Element>>{};
    final resolver = buildStep.resolver;
    final visibleLibraries = await resolver.libraries.toList();

    for (final library in visibleLibraries) {
      libraryElements[library] = library.topLevelElements.where(elementMatcher.test).toList();
    }

    await generate(library, libraryElements, buildStep);
  }

  Future<void> generate(
    LibraryElement library,
    Map<LibraryElement, List<Element>> elementMap,
    BuildStep buildStep,
  );
}
