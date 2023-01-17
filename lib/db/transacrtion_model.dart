import 'package:hive/hive.dart';

import 'package:money_manager_app/models/category_modal.dart';
part 'transacrtion_model.g.dart';

@HiveType(typeId: 3)
class TransactionModel {
  @HiveField(0)
  final String notes;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final CategoryType type;

  @HiveField(4)
  final CategoryModel category;

  String? id;

  TransactionModel({
    required this.notes,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  }) {
    id = DateTime.now().microsecondsSinceEpoch.toString();
  }
}
