import 'package:intl/intl.dart';

class Formatters {}

extension DoubleCurrency on double {
  String toBrl() {
    final format = NumberFormat.simpleCurrency(locale: 'pt_br');

    return format.format(this);
  }
}

extension DateTimeString on DateTime {
  String dayMonth() {
    final format = DateFormat('MMMMd', 'pt_br');

    return format.format(this);
  }
}
