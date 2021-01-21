import 'package:intl/intl.dart';

String toNumber(int value) {
  final formatter = new NumberFormat("#,###");
  return formatter.format(value);
}

String toDate(int value) {
  final f = new DateFormat('dd-MM-yyyy HH:mm');

  return f.format(new DateTime.fromMillisecondsSinceEpoch(value));
}
