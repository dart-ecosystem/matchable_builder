import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:matchable_builder/src/contract/Renderable.dart';
import 'package:meta/meta.dart';

class RequiredPart implements Renderable {
  final String path;

  const RequiredPart({
    @required this.path,
  });

  @override
  String render(LibraryElement library, List<Element> elements, BuildStep buildStep) {
    return 'part \'$path\';';
  }
}
