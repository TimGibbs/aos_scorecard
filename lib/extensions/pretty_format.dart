extension DateTimeExtension on DateTime {
  String prettyFormat() =>
      '${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
}
