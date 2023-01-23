// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/db/transaction_db.dart';

ValueNotifier<List<TransactionModel>> dateFilterNotifier =
    ValueNotifier(TransactionDB.instance.transactionListNotifier.value);

class FiltrationViewList extends StatelessWidget {
  const FiltrationViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.filter_list_rounded),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("All"),
          onTap: (() {
            dateFilterNotifier.value =
                TransactionDB.instance.transactionListNotifier.value;
          }),
        ),
        PopupMenuItem(
          child: Text("Today"),
          onTap: (() {
            dateFilterNotifier.value =
                TransactionDB.instance.transactionListNotifier.value;
            dateFilterNotifier.value = dateFilterNotifier.value
                .where((element) =>
                    element.date.day == DateTime.now().day &&
                    element.date.month == DateTime.now().month &&
                    element.date.year == DateTime.now().year)
                .toList();
          }),
        ),
        PopupMenuItem(
          child: Text("Yesterday"),
          onTap: (() {
            dateFilterNotifier.value =
                TransactionDB.instance.transactionListNotifier.value;
            dateFilterNotifier.value = dateFilterNotifier.value
                .where((element) =>
                    element.date.day - 1 == DateTime.now().day - 1 &&
                    element.date.month == DateTime.now().month &&
                    element.date.year == DateTime.now().year)
                .toList();
          }),
        ),
        PopupMenuItem(
          child: Text("Month"),
          onTap: (() {
            dateFilterNotifier = TransactionDB.instance.transactionListNotifier;
            dateFilterNotifier.value = dateFilterNotifier.value
                .where((element) =>
                    element.date.month == DateTime.now().month &&
                    element.date.year == DateTime.now().year)
                .toList();
          }),
        ),
      ],
    );
  }
}
