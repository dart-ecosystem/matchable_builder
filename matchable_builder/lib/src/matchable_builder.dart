import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:matchable_builder/src/filter/general/always_true_matcher.dart';
import 'package:matchable_builder/src/filter/matcher.dart';
import 'package:source_gen/source_gen.dart';

abstract class MatchableBuilder extends Builder {
  Matcher get buildStepMatcher => AlwaysTrueMatcher();

  Matcher get libraryMatcher => AlwaysTrueMatcher();

  Matcher get elementMatcher => AlwaysTrueMatcher();

  FutureOr<void> generate(List<Element> elements, BuildStep buildStep);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    if (!buildStepMatcher.test(buildStep)) {
      return;
    }

    // prepare
    final library = await _getLibrary(buildStep);

    // abort if library can't be resolved
    if (library == null) {
      return;
    }

    // check library
    if (!libraryMatcher.test(library)) {
      return;
    }

    final libraryReader = LibraryReader(library);

    final validElements = libraryReader.allElements.where(elementMatcher.test).toList();

    if (validElements.isEmpty) {
      return;
    }

    // generate
    await generate(validElements, buildStep);
  }

  Future<LibraryElement> _getLibrary(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    if (!await resolver.isLibrary(buildStep.inputId)) {
      return null;
    }
    return buildStep.inputLibrary;
  }
}
