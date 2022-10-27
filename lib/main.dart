import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:splitit/app_widget.dart';

void main() {
  initializeDateFormatting('pt_br').then(
    (_) => runApp(const AppWidget()),
  );
}
