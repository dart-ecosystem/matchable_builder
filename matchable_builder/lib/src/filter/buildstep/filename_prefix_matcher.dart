import 'package:matchable_builder/src/filter/buildstep/filename_matcher.dart';

class FilenamePrefixMatcher extends FilenameMatcher {
  FilenamePrefixMatcher(String prefix) : super(RegExp('^$prefix'));
}
