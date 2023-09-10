import 'package:expense_tracker/Widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveexpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveexpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.45),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveexpense(
            expenses[index],
          );
        },
        key: ValueKey(
          expenses[index],
        ),
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
