import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utilities/formatters.dart';
import '../../../shared/widgets/expense_tile.dart';
import '../services/budget_service.dart';
import '../controllers/budget_controller.dart';

class BudgetView extends StatefulWidget {
  const BudgetView({super.key});

  @override
  State<BudgetView> createState() => _BudgetViewState();
}

class _BudgetViewState extends State<BudgetView> {
  @override
  void initState() {
    super.initState();
    // Load budget when view initializes
    context.read<BudgetService>().loadBudget();
  }

  @override
  Widget build(BuildContext context) {
    final budgetService = context.watch<BudgetService>();
    final controller = context.read<BudgetController>();
    final budget = budgetService.current;

    if (budget == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final expenses = budget.totalExpenses;
    final totalExpenses =
        expenses.values.fold<double>(0, (p, e) => p + e);
    final remaining = budget.totalIncome - totalExpenses;

    return Scaffold(
      appBar: AppBar(title: const Text('Budget')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Income: ' +
                  Formatters.formatCurrency(budget.totalIncome),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: expenses.entries
                    .map(
                      (e) => ExpenseTile(
                        category: e.key,
                        amount: e.value,
                        date: budget.month,
                        // TODO: connect deletion to controller.removeExpense
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Remaining Balance: ' +
                  Formatters.formatCurrency(remaining),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Show form dialog to add expense
          controller.addExpense('misc', 0);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
