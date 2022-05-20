extension FormatString on Object? {
  String get unwrappedString {
    if (this is String?) {
      if (this == null) {
        return '-';
      } else {
        return (this as String?)!.isEmpty ? '-' : toString();
      }
    } else {
      return this?.toString() ?? '-';
    }
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
