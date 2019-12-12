import 'package:matchable_builder/src/filter/filename_matcher.dart';

class FilenameSuffixMatcher extends FilenameMatcher {
  FilenameSuffixMatcher(String suffix) : super(RegExp('$suffix\$'));
}
