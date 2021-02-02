class InMemoryCache<T> {
  DateTime lastUpdateAt;
  Duration expiresAfter = Duration(minutes: 5);
  T _cachedValue;

  bool get isEmpty {
    if (getCachedValue() == null) {
      return true;
    } else if (T is List) {
      return (getCachedValue() as List).isEmpty;
    } else {
      return false;
    }
  }

  bool get isNotEmpty => !isEmpty;

  bool get hasExpired =>
      lastUpdateAt.add(expiresAfter).isBefore(DateTime.now());

  bool get hasNotExpired => !hasExpired;

  T getCachedValue() => _cachedValue;

  void save(T data) {
    _cachedValue = data;
    lastUpdateAt = DateTime.now();
  }

  void clean() {
    _cachedValue = null;
  }

  void expireAfter(Duration dateTime) {
    expiresAfter = dateTime;
  }
}
