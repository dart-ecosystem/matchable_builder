import 'dart:async';

import 'package:build/src/builder/build_step.dart';
import 'package:build/src/builder/builder.dart';
import 'package:demo/src/demo_cache.dart';
import 'package:matchable_builder/matchable_builder.dart';

class DemoCombiner extends MatchableCombiningBuilder {
  DemoCombiner(BuilderOptions builderOptions) : super(builderOptions);

  @override
  Map<String, List<String>> get buildExtensions => {
        ".demo.json": [".demo.dart"]
      };

  @override
  Map<String, CacheResolver> get cacheResolveMap => {
        "**/*.demo.json": DemoCache.fromJson,
      };

  @override
  FutureOr<void> generate(Map<String, List<Object>> resolvedCache, BuildStep buildStep) {
    List<DemoCache> demoCaches = resolvedCache["**/*.demo.json"];
  }
}
