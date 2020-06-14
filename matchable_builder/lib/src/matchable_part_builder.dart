import 'dart:async';
import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:build/src/builder/builder.dart';
import 'package:matchable_builder/src/abstract_matchable_builder.dart';
import 'package:matchable_builder/src/support/RequiredImport.dart';
import 'package:matchable_builder/src/support/RequiredPart.dart';

abstract class MatchablePartBuilder extends AbstractMatchableBuilder {
  MatchablePartBuilder(BuilderOptions options) : super(options);

  List<RequiredImport> get requiredImports;

  List<RequiredPart> get requiredParts;

  @override
  Future<void> runGenerate(
    LibraryElement library,
    List<Element> elements,
    BuildStep buildStep,
  ) async {
    ensureRequiredImports(buildStep);
    ensureRequiredParts();
    generate(library, elements, buildStep);
  }

  Future<void> ensureRequiredImports(BuildStep buildStep) async {
    requiredImports.forEach((import) => _ensureRequiredImport(import, buildStep));
  }

  Future<void> _ensureRequiredImport(RequiredImport import, BuildStep buildStep) async {
    final library = await buildStep.inputLibrary;
    final shouldGenerate = !library.imports.any(
      (p) => p.uri == import.path && p.prefix?.name == import.prefix,
    );
    if (shouldGenerate) {
      final fileContent = await buildStep.readAsString(buildStep.inputId);
      final lines = fileContent.split('\n');
      final libraryLineNumber = lines.indexWhere((line) => line.startsWith('library'));

      lines.insert(
        libraryLineNumber + 1,
        'import \'${import.path}\' as ${import.prefix}; // Generated by ${this.runtimeType}',
      );

      final file = File(buildStep.inputId.path);
      final outputContent = lines.join('\n');
      await file.writeAsString(outputContent, flush: true);
    }
  }

  Future<void> ensureRequiredParts() async {}

  Future<void> _ensureRequiredPart(RequiredPart part) async {}

  Future<void> generate(
    LibraryElement library,
    List<Element> elements,
    BuildStep buildStep,
  );
}
