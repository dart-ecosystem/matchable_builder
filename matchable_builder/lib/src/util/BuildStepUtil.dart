import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

abstract class BuildStepUtil {
  static Future<LibraryElement> getLibrary(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    if (!await resolver.isLibrary(buildStep.inputId)) {
      return null;
    }
    return buildStep.inputLibrary;
  }
}
