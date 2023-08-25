import 'package:intl/intl.dart';

class AppUtils {
  static String ddMMMYYYY(String? date) {
    if (date != null && date != '') {
      DateFormat dateFormatter = DateFormat('dd MMM yyyy');
      return dateFormatter.format(DateTime.parse(date));
    }
    return '';
  }
}
