# Matchable Builder
Matchable builder used to build new files from existing ones.

## Usage
```dart
Builder demoBuilder(BuilderOptions ops) => DemoBuilder();

class DemoBuilder extends MatchableBuilder {
  @override
  Matcher get buildStepMatcher => Matcher.and([
        FilenameExtensionMatcher('.dart'),
      ]);

  @override
  Matcher get elementMatcher => Matcher.and([
        ElementTypeMatcher<ClassElement>(),
        ElementAnnotationMatcher<Deprecated>(),
        ElementNamePrefixMatcher('a'),
      ]);

  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': ['.demo.dart'],
      };

  @override
  FutureOr<void> generate(List<Element> elements, BuildStep buildStep) {
    print('${buildStep.inputId.path} | ${elements}');
    return null;
  }
}
```
