import 'package:matchable_builder/src/filter/buildstep/filename_matcher.dart';

class FilenamePrefixMatcher extends FilenameMatcher {
  FilenamePrefixMatcher(String suffix) : super(RegExp('$suffix\$'));
}
