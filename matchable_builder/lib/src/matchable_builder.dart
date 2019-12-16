import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:matchable_builder/src/abstract_matchable_builder.dart';

abstract class MatchableBuilder extends AbstractMatchableBuilder {
  MatchableBuilder(BuilderOptions options) : super(options);

  @override
  FutureOr<void> runGenerate(List<Element> elements, BuildStep buildStep) {
    return generate(elements, buildStep);
  }

  FutureOr<void> generate(List<Element> elements, BuildStep buildStep);
}
