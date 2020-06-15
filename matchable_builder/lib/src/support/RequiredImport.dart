import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:matchable_builder/src/contract/Renderable.dart';
import 'package:meta/meta.dart';

class RequiredImport implements Renderable {
  final String path;

  final String prefix;

  const RequiredImport({
    @required this.path,
    @required this.prefix,
  });

  @override
  String render(LibraryElement library, List<Element> elements, BuildStep buildStep) {
    return prefix == null ? 'import \'$path\';' : 'import \'$path\' as $prefix;';
  }
}
