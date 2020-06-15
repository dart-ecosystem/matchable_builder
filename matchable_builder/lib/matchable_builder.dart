library matchable_builder;

// builder
export 'package:matchable_builder/src/MatchableBuilder.dart';
export 'package:matchable_builder/src/MatchableCombiningBuilder.dart';
export 'package:matchable_builder/src/MatchablePartBuilder.dart';

// base matcher
export 'package:matchable_builder/src/matcher/Matcher.dart';

// general matcher
export 'package:matchable_builder/src/matcher/general/AlwaysTrueMatcher.dart';
export 'package:matchable_builder/src/matcher/general/AlwaysFalseMatcher.dart';
export 'package:matchable_builder/src/matcher/general/AndMatcher.dart';
export 'package:matchable_builder/src/matcher/general/OrMatcher.dart';
export 'package:matchable_builder/src/matcher/general/NotMatcher.dart';
export 'package:matchable_builder/src/matcher/general/PredicateMatcher.dart';

// file matcher
export 'package:matchable_builder/src/matcher/file/FilenameExactExtensionMatcher.dart';
export 'package:matchable_builder/src/matcher/file/FilenameExtensionMatcher.dart';
export 'package:matchable_builder/src/matcher/file/FilenameMatcher.dart';
export 'package:matchable_builder/src/matcher/file/FilenamePrefixMatcher.dart';
export 'package:matchable_builder/src/matcher/file/FilenameSuffixMatcher.dart';
export 'package:matchable_builder/src/matcher/file/FileSchemaMatcher.dart';

// element matcher
export 'package:matchable_builder/src/matcher/element/ClassElementAssignableFromMatcher.dart';
export 'package:matchable_builder/src/matcher/element/ClassElementConstructorAnnotationMatcher.dart';
export 'package:matchable_builder/src/matcher/element/ClassElementConstructorMatcher.dart';
export 'package:matchable_builder/src/matcher/element/ClassElementFieldAnnotationMatcher.dart';
export 'package:matchable_builder/src/matcher/element/ClassElementInterfaceMatcher.dart';
export 'package:matchable_builder/src/matcher/element/ClassElementMatcher.dart';
export 'package:matchable_builder/src/matcher/element/ClassElementMethodAnnotationMatcher.dart';
export 'package:matchable_builder/src/matcher/element/ClassElementSuperTypeMatcher.dart';
export 'package:matchable_builder/src/matcher/element/ElementAnnotationMatcher.dart';
export 'package:matchable_builder/src/matcher/element/ElementNameMatcher.dart';
export 'package:matchable_builder/src/matcher/element/ElementNameSuffixMatcher.dart';
export 'package:matchable_builder/src/matcher/element/ElementNamePrefixMatcher.dart';
export 'package:matchable_builder/src/matcher/element/ElementTypeMatcher.dart';

// cache related
export 'package:matchable_builder/src/cache/cache.dart';

// helpers
export 'package:matchable_builder/src/helper/cache_helper.dart';

// dependencies
export 'package:build/build.dart';
export 'package:analyzer/dart/element/element.dart';
export 'package:analyzer/dart/element/type.dart';

// support
export 'package:matchable_builder/src/support/RequiredImport.dart';
export 'package:matchable_builder/src/support/RequiredPart.dart';
export 'package:matchable_builder/src/support/ChangeExtensionPart.dart';
