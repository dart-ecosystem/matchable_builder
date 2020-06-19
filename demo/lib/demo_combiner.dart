import 'package:build/src/builder/build_step.dart';
import 'package:build/src/builder/builder.dart';
import 'package:matchable_builder/matchable_builder.dart';

class DemoCombiner extends MatchableDependentBuilder {
  DemoCombiner(BuilderOptions builderOptions) : super(builderOptions);

  bool get resolveForAllPackages => true;

  @override
  Matcher<BuildStep> get fileMatcher => FilenameMatcher('demo.dart');

  @override
  Matcher<Element> get elementMatcher => Matcher.and([
        ClassElementMatcher(shouldBePublic: true),
      ]);

  @override
  Map<String, List<String>> get buildExtensions => {
        ".dart": [".demo.dart"],
      };

  @override
  Future<void> generate(
    LibraryElement library,
    Map<LibraryElement, List<Element>> elementDict,
    BuildStep buildStep,
  ) {
    final outputId = buildStep.inputId.changeExtension('.demo.dart');
    final lines = <String>[];
    final contentLines = <String>['var dict = ['];
    var index = 0;

    for (final entry in elementDict.entries) {
      if (entry.key.name == 'dart._internal') {
        continue;
      }
      lines.add('import \'${entry.key.source.uri.toString()}\' as p$index;');
      for (final element in entry.value) {
        contentLines.add('p$index.${element.name},');
      }
      index++;
    }

    contentLines.add('];');

    buildStep.writeAsString(outputId, lines.join('\n') + '\n' + contentLines.join('\n'));
    return null;
  }
}
