extension DateTimeExt on DateTime {
  DateTime get startOfDay => DateTime(year, month, day);

  bool get isTodayOrLater {
    final now = DateTime.now().startOfDay;
    return this == now || isAfter(now);
  }

  bool isSameDayAs(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return isSameDayAs(yesterday);
  }

  bool get isToday => isSameDayAs(DateTime.now());

  bool get isNotToday => !isToday;
}
