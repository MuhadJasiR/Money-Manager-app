import 'package:flutter/material.dart';
import 'package:money_manager_app/db/transaction_db.dart';
import 'package:money_manager_app/screens/view_all.dart';

class FiltrationViewList extends StatelessWidget {
  const FiltrationViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.calendar_month),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: (() {
            allUsers.value =
                TransactionDB.instance.transactionListNotifier.value;
          }),
          child: const Text("All"),
        ),
        PopupMenuItem(
          onTap: (() {
            TransactionDB.instance.transactionListNotifier.value;
            allUsers.value = allUsers.value
                .where((element) =>
                    element.date.day == DateTime.now().day &&
                    element.date.month == DateTime.now().month &&
                    element.date.year == DateTime.now().year)
                .toList();
          }),
          child: const Text("Today"),
        ),
        PopupMenuItem(
          onTap: (() {
            allUsers.value =
                TransactionDB.instance.transactionListNotifier.value;
            allUsers.value = allUsers.value
                .where((element) =>
                    element.date.day == DateTime.now().day - 1 &&
                    element.date.month == DateTime.now().month &&
                    element.date.year == DateTime.now().year)
                .toList();
          }),
          child: const Text("Yesterday"),
        ),
        PopupMenuItem(
          onTap: (() {
            allUsers.value =
                TransactionDB.instance.transactionListNotifier.value;
            allUsers.value = allUsers.value
                .where((element) =>
                    element.date.month == DateTime.now().month &&
                    element.date.year == DateTime.now().year)
                .toList();
          }),
          child: const Text("Month"),
        ),
      ],
    );
  }
}
