import 'package:cloud_firestore/cloud_firestore.dart';

DateTime dateTimeFromTimestamp(Timestamp? timestamp) {
  if (timestamp == null) return DateTime.fromMillisecondsSinceEpoch(0);
  return timestamp.toDate();
}

Timestamp dateTimeToTimestamp(DateTime dateTime) =>
    Timestamp.fromDate(dateTime);
