import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:matchable_builder/src/cache/cache.dart';

class CacheHelper {
  BuildStep _buildStep;

  CacheHelper(this._buildStep);

  Future<void> writeAsset(AssetId assetId, Cache cache) {
    assert(cache != null, "cache must NOT be null");
    return _buildStep.writeAsString(assetId, cache.toString());
  }

  Future<void> writeAssetToExtension(String extension, Cache cache) {
    assert(cache != null, "cache must NOT be null");
    return _buildStep.writeAsString(
      _buildStep.inputId.changeExtension(extension),
      cache.toString(),
    );
  }

  Future<List<AssetId>> findAssets(String globPattern) async {
    return _buildStep
        .findAssets(
          Glob(globPattern),
        )
        .toList();
  }

  Future<List<String>> readAssets(String globPattern) async {
    final List<String> assets = [];
    final assetIds = await findAssets(globPattern);
    for (var assetId in assetIds) {
      assets.add(await _buildStep.readAsString(assetId));
    }
    return assets;
  }
}
