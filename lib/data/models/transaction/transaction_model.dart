import 'dart:ui';

class TransactionModel{
  final String name;
  final String date;
  final double price;
  final String expense;
  final String iconName;
  final Color iconColor;

  TransactionModel({
    required this.name,
    required this.date,
    required this.price,
    required this.expense,
    required this.iconName,
    required this.iconColor,
});
}