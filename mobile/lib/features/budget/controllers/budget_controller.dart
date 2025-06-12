import 'package:flutter/material.dart';

import '../services/budget_service.dart';
import '../models/budget_model.dart';

class BudgetController extends ChangeNotifier {
  final BudgetService service;
  String? _error;

  String? get error => _error;

  BudgetController({required this.service});

  Future<void> addExpense(String category, double amount) async {
    _error = null;
    try {
      final current = service.current;
      if (current == null) throw Exception('No budget loaded');
      final expenses = Map<String, double>.from(current.totalExpenses);
      expenses[category] = (expenses[category] ?? 0) + amount;
      final updated = current.copyWith(totalExpenses: expenses);
      await service.saveBudget(updated);
    } catch (e) {
      _error = e.toString();
    }
    notifyListeners();
  }

  Future<void> removeExpense(String id) async {
    _error = null;
    try {
      // TODO: implement expense removal when Expense model is added
      final BudgetModel? current = service.current;
      if (current != null) {
        final expenses = Map<String, double>.from(current.totalExpenses);
        expenses.remove(id);
        final updated = current.copyWith(totalExpenses: expenses);
        await service.saveBudget(updated);
      }
    } catch (e) {
      _error = e.toString();
    }
    notifyListeners();
  }
}
