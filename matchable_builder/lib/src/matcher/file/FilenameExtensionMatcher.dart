import 'package:matchable_builder/src/matcher/file/FilenameMatcher.dart';

class FilenameExtensionMatcher extends FilenameMatcher {
  FilenameExtensionMatcher(String fileExtension) : super(RegExp('\.$fileExtension\$'));
}
