import 'package:matchable_builder/src/matcher/filename_matcher.dart';

class FilenameSuffixMatcher extends FilenameMatcher {
  FilenameSuffixMatcher(String suffix) : super(RegExp('$suffix\$'));
}
