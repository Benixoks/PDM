extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toDigitsOnly() {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }

  List<String> getFirstAndLastName() {
    var words = split(' ');
    return [words.first, words.last];
  }
}
