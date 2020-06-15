class PredicateMatcher {
  BuildStepPredicate _predicate;

  PredicateMatcher(this._predicate);

  @override
  bool test(Object source) {
    return _predicate(source);
  }
}

typedef bool BuildStepPredicate(Object source);
