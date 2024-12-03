import 'package:timeago/timeago.dart' as timeago;
import 'package:easy_localization/easy_localization.dart';

String formatDateWithLocale(String dateString, String locale) {
  DateTime date = DateTime.parse(dateString);
  DateFormat dateFormatter;
  if (locale == 'ar') {
    dateFormatter = DateFormat.yMMMMd('ar');
  } else {
    dateFormatter = DateFormat.yMMMMd('en');
  }

  return dateFormatter.format(date);
}

String formatTimeAgo(String dateString, String locale) {
  DateTime date = DateTime.parse(dateString);
  if (locale == 'ar') {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    return timeago.format(date, locale: 'ar');
  } else {
    timeago.setLocaleMessages('en', timeago.EnMessages());
    return timeago.format(date, locale: 'en');
  }
}
