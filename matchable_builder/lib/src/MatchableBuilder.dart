import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:matchable_builder/src/AbstractMatchableBuilder.dart';

abstract class MatchableBuilder extends AbstractMatchableBuilder {
  MatchableBuilder(BuilderOptions options) : super(options);

  @override
  Future<void> runGenerate(LibraryElement library, List<Element> elements, BuildStep buildStep) {
    return generate(library, elements, buildStep);
  }

  Future<void> generate(LibraryElement library, List<Element> elements, BuildStep buildStep);
}
