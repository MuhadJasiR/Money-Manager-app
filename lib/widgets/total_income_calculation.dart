import 'package:flutter/foundation.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/db/transaction_db.dart';
import 'package:money_manager_app/models/category_modal.dart';

ValueNotifier totalAmount = ValueNotifier(0.0);
ValueNotifier incomeTotal = ValueNotifier(0.0);
ValueNotifier expenseTotal = ValueNotifier(0.0);

totalIncomeExpenses() {
  totalAmount.value = 0;
  incomeTotal.value = 0;
  expenseTotal.value = 0;
  final List<TransactionModel> value =
      TransactionDB.instance.transactionListNotifier.value;
  for (int i = 0; i < value.length; i++) {
    if (CategoryType.income == value[i].category.type) {
      incomeTotal.value = incomeTotal.value + value[i].amount;
    } else {
      expenseTotal.value = expenseTotal.value + value[i].amount;
    }
  }
  totalAmount.value = incomeTotal.value - expenseTotal.value;
}
