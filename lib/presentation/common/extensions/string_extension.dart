extension CapitalizeString on String {
  String get capitalized {
    if (isEmpty) {
      return this;
    } else {
      return replaceFirst(this[0], this[0].toUpperCase());
    }
  }
}
