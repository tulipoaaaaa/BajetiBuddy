import 'package:flutter/material.dart';

import '../../core/utilities/formatters.dart';

class ExpenseTile extends StatelessWidget {
  final String category;
  final double amount;
  final DateTime date;

  const ExpenseTile({
    super.key,
    required this.category,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category),
      subtitle: Text(Formatters.formatDate(date)),
      trailing: Text(Formatters.formatCurrency(amount)),
      // TODO: Add swipe-to-delete callback using Dismissible
    );
  }
}
