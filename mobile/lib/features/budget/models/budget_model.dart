import 'package:meta/meta.dart';

@immutable
class BudgetModel {
  final double totalIncome;
  final Map<String, double> totalExpenses;
  final DateTime month;

  const BudgetModel({
    required this.totalIncome,
    required this.totalExpenses,
    required this.month,
  });

  factory BudgetModel.fromJson(Map<String, dynamic> json) => BudgetModel(
        totalIncome: (json['totalIncome'] as num).toDouble(),
        totalExpenses: Map<String, double>.from(
          (json['totalExpenses'] as Map).map(
            (k, v) => MapEntry(k as String, (v as num).toDouble()),
          ),
        ),
        month: DateTime.parse(json['month'] as String),
      );

  Map<String, dynamic> toJson() => {
        'totalIncome': totalIncome,
        'totalExpenses': totalExpenses,
        'month': month.toIso8601String(),
      };

  BudgetModel copyWith({
    double? totalIncome,
    Map<String, double>? totalExpenses,
    DateTime? month,
  }) {
    return BudgetModel(
      totalIncome: totalIncome ?? this.totalIncome,
      totalExpenses: totalExpenses ?? this.totalExpenses,
      month: month ?? this.month,
    );
  }
}
