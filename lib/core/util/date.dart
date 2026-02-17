DateTime get nowDate => DateTime.now();
DateTime get nowMidDate => DateTime(
  nowDate.year,
  nowDate.month,
  nowDate.day,
);

bool isContainDate(
  DateTime? startAt,
  DateTime? endAt,
) {
  if (startAt == null) {
    startAt = nowDate;
  }

  if (endAt == null) {
    endAt = nowDate;
  }

  final bool isBefore = nowDate.isBefore(startAt.toLocal());
  final bool isAfter = nowDate.isAfter(endAt.toLocal());

  return !isBefore && !isAfter;
}

DateTime getMidDate(DateTime dateTime) {
  final DateTime midDate = DateTime(
    dateTime.toLocal().year,
    dateTime.toLocal().month,
    dateTime.toLocal().day,
  );

  return midDate;
}
