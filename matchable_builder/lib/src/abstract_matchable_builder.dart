import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:matchable_builder/src/matchable_source.dart';
import 'package:matchable_builder/src/matcher/matcher.dart';
import 'package:source_gen/source_gen.dart';

abstract class AbstractMatchableBuilder extends Builder {
  Matcher get matcher;

  FutureOr<void> runGenerate(LibraryElement library, List<Element> elements, BuildStep buildStep);

  BuilderOptions options;

  AbstractMatchableBuilder(this.options);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    // prepare
    final library = await _getLibrary(buildStep);

    // abort if library can't be resolved
    if (library == null) {
      return runGenerate(library, [], buildStep);
    }

    final matchableSource = MatchableSource()
      ..libraryElement = library
      ..buildStep = buildStep;

    final libraryReader = LibraryReader(library);

    final validElements = libraryReader.allElements.where((element) {
      return matcher.test(matchableSource..element = element);
    }).toList();

    // generate
    await runGenerate(library, validElements, buildStep);
  }

  Future<LibraryElement> _getLibrary(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    if (!await resolver.isLibrary(buildStep.inputId)) {
      return null;
    }
    return buildStep.inputLibrary;
  }
}
