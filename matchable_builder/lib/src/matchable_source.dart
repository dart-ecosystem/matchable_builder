import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

class MatchableSource {
  BuildStep buildStep;
  LibraryElement libraryElement;
  Element element;
}
