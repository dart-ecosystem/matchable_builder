# Matchable Builder
Matchable builder provides a easier way to find files that you want generate code from.

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
