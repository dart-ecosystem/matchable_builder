import 'package:matchable_builder/src/matcher/file/FilenameMatcher.dart';

class FilenamePrefixMatcher extends FilenameMatcher {
  FilenamePrefixMatcher(String prefix) : super(RegExp('^$prefix'));
}
