import 'package:matchable_builder/src/matcher/file/FilenameMatcher.dart';

class FilenameSuffixMatcher extends FilenameMatcher {
  FilenameSuffixMatcher(String suffix) : super(RegExp('$suffix\$'));
}
