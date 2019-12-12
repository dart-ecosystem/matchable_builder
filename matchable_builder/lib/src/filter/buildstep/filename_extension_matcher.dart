import 'package:matchable_builder/src/filter/buildstep/filename_matcher.dart';

class FilenameExtensionMatcher extends FilenameMatcher {
  FilenameExtensionMatcher(String fileExtension) : super(RegExp('\.$fileExtension\$'));
}
