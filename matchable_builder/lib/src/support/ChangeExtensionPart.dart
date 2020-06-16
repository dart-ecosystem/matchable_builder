import 'package:matchable_builder/matchable_builder.dart';
import 'package:meta/meta.dart';

class ChangeExtensionPart extends RequiredPart {
  final String extension;

  const ChangeExtensionPart({
    @required this.extension,
  }) : super(path: '');

  @override
  String render(
    LibraryElement library,
    List<Element> elements,
    BuildStep buildStep,
  ) {
    final path = buildStep.inputId.changeExtension(extension).pathSegments.last;
    return 'part \'$path\';';
  }

  @override
  bool match(
    CompilationUnitElement part,
    LibraryElement library,
    List<Element> elements,
    BuildStep buildStep,
  ) {
    return part.uri == buildStep.inputId.changeExtension(extension).pathSegments.last;
  }
}
