abstract class Matcher {
  bool test(Object element);

  static T and<T extends Matcher>(List<T> filters) {
    return AndFilter<T>(filters) as T;
  }

  static T or<T extends Matcher>(List<T> filters) {
    return OrFilter<T>(filters) as T;
  }

  static T not<T extends Matcher>(T filter) {
    return NotFilter<T>(filter) as T;
  }
}

class AndFilter<T extends Matcher> implements Matcher {
  List<T> filters;

  AndFilter(this.filters);

  @override
  bool test(Object element) {
    if (filters == null) {
      return true;
    }
    return filters.every((filter) => filter.test(element));
  }
}

class OrFilter<T extends Matcher> implements Matcher {
  List<T> filters;

  OrFilter(this.filters);

  @override
  bool test(Object element) {
    if (filters == null) {
      return true;
    }
    return filters.any((filter) => filter.test(element));
  }
}

class NotFilter<T extends Matcher> implements Matcher {
  T filter;

  NotFilter(this.filter);

  @override
  bool test(Object element) {
    return !filter.test(element);
  }
}
