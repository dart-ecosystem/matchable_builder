import 'package:matchable_builder/src/matcher/file/FilenameMatcher.dart';

class FilenameExactExtensionMatcher extends FilenameMatcher {
  FilenameExactExtensionMatcher(String fileExtension) : super(RegExp('^[^.]+\.?$fileExtension\$'));
}
