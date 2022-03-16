class DateTimeFormat {
  final String pattern;

  DateTimeFormat(this.pattern);

  String format(DateTime dateTime) {
    final year = dateTime.year;
    final month = dateTime.month;
    final day = dateTime.day;
    final hour = dateTime.hour;
    final minute = dateTime.minute;
    final second = dateTime.second;
    final formatted = '$day-$month-$year $hour:$minute:$second';
    return formatted;
  }
}
