import 'package:intl/intl.dart';

class Formatters {}

extension DoubleCurrency on double {
  String real() {
    final format = NumberFormat.simpleCurrency(locale: 'pt_br');

    return format.format(this);
  }
}
