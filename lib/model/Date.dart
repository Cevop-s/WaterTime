class Date {
  late int Month;
  late List<int> Days = [];
  late int Year;
  late int SelectedDay;

  void GetDates() {
    DateTime now = new DateTime.now();
    SelectedDay = now.day;
    DateTime lastDayOfMonth = new DateTime(now.year, now.month + 1, 0);

    var wantedDate = new DateTime.now().subtract(Duration(days: 30)).day;
    var wantedMonth = new DateTime.now().subtract(Duration(days: 30)).month;

    for (int i = 0; i < lastDayOfMonth.day; i++) {
      Days.add(i + 1);
    }
    Year = lastDayOfMonth.year;
    Month = lastDayOfMonth.month;
  }
}
