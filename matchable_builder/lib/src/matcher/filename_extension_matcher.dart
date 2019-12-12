import 'package:matchable_builder/src/matcher/filename_matcher.dart';

class FilenameExtensionMatcher extends FilenameMatcher {
  FilenameExtensionMatcher(String fileExtension) : super(RegExp('\.$fileExtension\$'));
}
