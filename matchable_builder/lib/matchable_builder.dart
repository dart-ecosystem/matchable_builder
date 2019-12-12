library matchable_builder;

// builder
export 'package:matchable_builder/src/matchable_builder.dart';

// base filter
export 'package:matchable_builder/src/filter/matcher.dart';
export 'package:matchable_builder/src/filter/build_step_matcher.dart';
export 'package:matchable_builder/src/filter/element_matcher.dart';
export 'package:matchable_builder/src/filter/library_matcher.dart';

// general filters
export 'package:matchable_builder/src/filter/general/always_true_matcher.dart';
export 'package:matchable_builder/src/filter/general/always_false_matcher.dart';

// build step filters
export 'package:matchable_builder/src/filter/buildstep/filename_extension_matcher.dart';
export 'package:matchable_builder/src/filter/buildstep/filename_matcher.dart';

// element filters
export 'package:matchable_builder/src/filter/element/element_annotation_matcher.dart';
export 'package:matchable_builder/src/filter/element/element_type_matcher.dart';
export 'package:matchable_builder/src/filter/element/element_name_matcher.dart';
export 'package:matchable_builder/src/filter/element/element_name_prefix_matcher.dart';
export 'package:matchable_builder/src/filter/element/element_name_suffix_matcher.dart';
