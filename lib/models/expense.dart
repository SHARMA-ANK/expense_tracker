import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
const uuid=Uuid();
final formatter =DateFormat.yMd();
enum Category{
  food,travel,leisure,work,milk,education
}
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel:Icons.flight,
  Category.milk:FontAwesomeIcons.bottleWater,
  Category.work:Icons.work,
  Category.education: FontAwesomeIcons.pen,
  Category.leisure: Icons.movie,
};

class Expense{
  Expense({required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }): id=uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }
}

class ExpenseBucket{
  const ExpenseBucket({
    required this.category,
    required this.expenses,
});

  ExpenseBucket.forCategory(List<Expense> allExpense,this.category)
      : expenses=allExpense.where((expense) => expense.category==category)
      .toList();
  final Category category;
  final List<Expense> expenses;
  double get totalExpenses{
    double sum=0;
    for(final expense in expenses){
      sum+=expense.amount;
    }

    return sum;
  }
}