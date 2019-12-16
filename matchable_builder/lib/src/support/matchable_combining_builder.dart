import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:matchable_builder/src/cache/cache.dart';
import 'package:matchable_builder/src/helper/cache_helper.dart';
import 'package:matchable_builder/src/matchable_base_builder.dart';
import 'package:matchable_builder/src/matcher/always_true_matcher.dart';
import 'package:matchable_builder/src/matcher/matcher.dart';

typedef Object CacheResolver(Map<String, dynamic> json);

abstract class MatchableCombiningBuilder extends MatchableBaseBuilder {
  Matcher get matcher => AlwaysTrueMatcher();

  Map<String, CacheResolver> get cacheResolveMap;

  MatchableCombiningBuilder(BuilderOptions options) : super(options);

  FutureOr<void> generate(Map<String, List<Object>> resolvedCache, BuildStep buildStep);

  @override
  FutureOr<void> runGenerate(List<Element> elements, BuildStep buildStep) async {
    final Map<String, List<Object>> resolvedCache = {};
    final cacheHelper = CacheHelper(buildStep);
    for (var entry in cacheResolveMap.entries) {
      final assets = await cacheHelper.readAssets(entry.key);
      final resolver = entry.value;
      resolvedCache[entry.key] = assets.map(json.decode).map((e) => resolver(e)).toList();
    }

    await generate(resolvedCache, buildStep);
  }
}
