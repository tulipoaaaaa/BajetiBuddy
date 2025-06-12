import 'package:intl/intl.dart';

class Formatters {
  static final NumberFormat _currencyFormatter = NumberFormat.currency(
    locale: 'en_KE',
    symbol: 'Ksh',
  );

  static final DateFormat _dateFormatter = DateFormat('dd/MM/yyyy');

  static String formatCurrency(num value) {
    return _currencyFormatter.format(value);
  }

  static String formatDate(DateTime date) {
    return _dateFormatter.format(date);
  }

  static String shortenNumber(num value) {
    if (value.abs() >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value.abs() >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }
    return value.toString();
  }
}
