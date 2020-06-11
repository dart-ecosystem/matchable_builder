import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:matchable_builder/src/abstract_matchable_builder.dart';

abstract class MatchableBuilder extends AbstractMatchableBuilder {
  MatchableBuilder(BuilderOptions options) : super(options);

  @override
  FutureOr<void> runGenerate(LibraryElement library, List<Element> elements, BuildStep buildStep) {
    return generate(library, elements, buildStep);
  }

  FutureOr<void> generate(LibraryElement library, List<Element> elements, BuildStep buildStep);
}
