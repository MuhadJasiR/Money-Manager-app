// ignore_for_file: no_leading_underscores_for_local_identifiers, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/widgets/total_income_calculation.dart';

// ignore: constant_identifier_names
const TRANSACTION_DB_NAME = 'transaction-database';

abstract class TransactionDBfunctions {
  Future<void> addTransaction(TransactionModel obj);
  Future<List<TransactionModel>> getAllTransaction();
  Future<void> deleteTransaction(TransactionModel obj);
  Future<void> updateTransactionModel(TransactionModel value);
}

class TransactionDB implements TransactionDBfunctions {
  TransactionDB._internal();

  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB() {
    return instance;
  }
  ValueNotifier<List<TransactionModel>> transactionListNotifier =
      ValueNotifier([]);

  @override
  Future<void> addTransaction(TransactionModel obj) async {
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _db.put(obj.id, obj);
    refresh();
  }

  Future<void> refresh() async {
    final _list = await getAllTransaction();
    _list.sort(((first, second) => second.date.compareTo(first.date)));
    transactionListNotifier.value.clear();
    transactionListNotifier.value.addAll(_list);
    totalIncomeExpenses();
    transactionListNotifier.notifyListeners();
  }

  @override
  Future<List<TransactionModel>> getAllTransaction() async {
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return _db.values.toList();
  }

  @override
  Future<void> deleteTransaction(TransactionModel obj) async {
    print(obj.amount);
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    print(obj.id);

    await _db.delete(obj.id);
    print("asd");

    refresh();
  }

  @override
  Future<void> updateTransactionModel(TransactionModel value) async {
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _db.put(value.id, value);
    refresh();
  }
}
