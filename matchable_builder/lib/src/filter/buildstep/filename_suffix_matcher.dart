import 'package:matchable_builder/src/filter/buildstep/filename_matcher.dart';

class FilenameSuffixMatcher extends FilenameMatcher {
  FilenameSuffixMatcher(String suffix) : super(RegExp('$suffix\$'));
}
