import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/budget_model.dart';

class BudgetService extends ChangeNotifier {
  BudgetModel? _current;

  BudgetModel? get current => _current;

  Future<void> loadBudget() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('budget');
    if (data != null) {
      final json = jsonDecode(data) as Map<String, dynamic>;
      _current = BudgetModel.fromJson(json);
    }
    notifyListeners();
  }

  Future<void> saveBudget(BudgetModel budget) async {
    _current = budget;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('budget', jsonEncode(budget.toJson()));
    notifyListeners();
  }
}
