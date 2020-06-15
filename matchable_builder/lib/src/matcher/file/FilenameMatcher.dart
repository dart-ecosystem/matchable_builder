import 'dart:async';

import 'package:matchable_builder/matchable_builder.dart';

class FilenameMatcher implements Matcher<BuildStep> {
  Pattern filenamePattern;

  FilenameMatcher(this.filenamePattern);

  @override
  FutureOr<bool> test(BuildStep buildStep) {
    final filename = buildStep.inputId.uri.pathSegments.last;

    if (filenamePattern is String) {
      return filenamePattern == filename;
    }

    if (filenamePattern is RegExp) {
      return (filenamePattern as RegExp).hasMatch(filename);
    }

    return false;
  }
}
