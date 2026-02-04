import 'package:intl/intl.dart';

String formatDate(String? date) {
  if (date == null) return '--';
  try {
    final dateTime = DateTime.parse(date);
    return DateFormat('dd MMM yyyy').format(dateTime);
  } catch (e) {
    return '--';
  }
}
