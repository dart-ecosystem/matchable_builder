import 'package:matchable_builder/src/matcher/filename_matcher.dart';

class FilenameExactExtensionMatcher extends FilenameMatcher {
  FilenameExactExtensionMatcher(String fileExtension) : super(RegExp('^[^.]+\.?$fileExtension\$'));
}
