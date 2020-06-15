import 'dart:async';

import 'package:matchable_builder/src/matcher/Matcher.dart';

class AlwaysFalseMatcher implements Matcher<Object> {
  @override
  FutureOr<bool> test(Object ignored) {
    return false;
  }
}
