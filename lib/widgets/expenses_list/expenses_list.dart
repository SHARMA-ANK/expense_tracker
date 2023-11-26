import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key,required this.expenses,required this.onRemoveExpense});
  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    /* we don't use column as the size of list is infinite
    and if uses the column then all the widgets will be processed after the start of the app at the same time means will be made
    visible even if they are not shown that costs performance of the app*/
    return ListView.builder(
      itemBuilder: (ctx,index) => Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(color: Theme.of(context).colorScheme.error.withOpacity(0.5),
          margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          ),
          onDismissed: (direction){
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(expense: expenses[index],)
      ),
      itemCount: expenses.length,

    );
  }
}
