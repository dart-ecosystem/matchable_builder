import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

abstract class Renderable {
  String render(LibraryElement library, List<Element> elements, BuildStep buildStep);
}
