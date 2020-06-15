import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:matchable_builder/src/abstract_matchable_builder.dart';
import 'package:matchable_builder/src/helper/cache_helper.dart';
import 'package:matchable_builder/src/matcher/always_true_matcher.dart';
import 'package:matchable_builder/src/matcher/matcher.dart';

typedef Object CacheResolver(Map<String, dynamic> json);

abstract class MatchableCombiningBuilder extends AbstractMatchableBuilder {
  Matcher get matcher => AlwaysTrueMatcher();

  Map<String, CacheResolver> get resolveCaches;

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
    final cacheHelper = CacheHelper(buildStep);
    for (var entry in resolveCaches.entries) {
      final assets = await cacheHelper.readAssets(entry.key);
      final resolver = entry.value;
      resolvedCache[entry.key] = assets.map(json.decode).map((e) => resolver(e)).toList();
    }

    await generate(library, resolvedCache, buildStep);
  }
}
