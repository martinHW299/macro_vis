import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

DateTime getBoliviaDateTime() {
  // Load timezone data
  tzdata.initializeTimeZones();

  tz.Location boliviaTimezone = tz.getLocation('America/La_Paz');

  // Get the current time in the Bolivia timezone
  tz.TZDateTime boliviaDateTime = tz.TZDateTime.now(boliviaTimezone);

  return boliviaDateTime.subtract(const Duration(hours: 4));
}
