import 'package:matchable_builder/src/filter/filename_matcher.dart';

class FilenameExtensionMatcher extends FilenameMatcher {
  FilenameExtensionMatcher(String fileExtension) : super(RegExp('\.$fileExtension\$'));
}
