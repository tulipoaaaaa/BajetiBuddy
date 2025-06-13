import 'package:bajeti_buddy/main.dart';

class BudgetRepository {
  final BudgetService _budgetService;

  BudgetRepository({BudgetService? budgetService})
      : _budgetService = budgetService ?? BudgetService();

  Future<Map<String, dynamic>> getBudget() async {
    // TODO: retrieve budget from local storage or API
    return <String, dynamic>{};
  }

  Future<void> addExpense(Map<String, dynamic> expense) async {
    // TODO: persist expense locally and queue sync
  }

  Future<void> saveBudget(Map<String, dynamic> budget) async {
    // TODO: integrate remote sync or caching logic
  }
}
