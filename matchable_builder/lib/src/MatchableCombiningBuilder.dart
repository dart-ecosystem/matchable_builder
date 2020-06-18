import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:glob/glob.dart';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:matchable_builder/src/AbstractMatchableBuilder.dart';
import 'package:matchable_builder/src/helper/CacheHelper.dart';
import 'package:matchable_builder/src/matcher/Matcher.dart';
import 'package:matchable_builder/src/matcher/general/AlwaysTrueMatcher.dart';

typedef Object CacheResolver(Map<String, dynamic> json);

abstract class MatchableCombiningBuilder extends AbstractMatchableBuilder {
  Matcher<BuildStep> get fileMatcher => AlwaysTrueMatcher();

  Map<String, CacheResolver> get resolveCaches;

  bool get resolveForAllPackages => false;

  MatchableCombiningBuilder(BuilderOptions options) : super(options);

  FutureOr<void> generate(
      LibraryElement library, Map<String, List<Object>> resolvedCaches, BuildStep buildStep);

  @override
  FutureOr<void> runGenerate(
    LibraryElement library,
    List<Element> elements,
    BuildStep buildStep,
  ) async {
    final Map<String, List<Object>> resolvedCache = {};
    for (var entry in resolveCaches.entries) {
      final assets = await findAssets(buildStep, entry.key);
      final resolver = entry.value;
      resolvedCache[entry.key] = assets.map(json.decode).map((e) => resolver(e)).toList();
    }

    await generate(library, resolvedCache, buildStep);
  }

  Future<List<String>> findAssets(BuildStep buildStep, String globPattern) async {
    if (resolveForAllPackages == true) {
      final files = Glob(globPattern, recursive: true)
          .listSync(
            root: '.dart_tool/build/generated',
          )
          .whereType<File>();

      return files.map((f) => f.readAsStringSync()).toList();
    }

    return await CacheHelper(buildStep).readAssets(globPattern);
  }
}
