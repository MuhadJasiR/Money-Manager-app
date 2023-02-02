// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/db/transaction_db.dart';
import 'package:money_manager_app/models/category_modal.dart';
import 'package:money_manager_app/screens/edit_transaction_screen.dart';
import 'package:money_manager_app/widgets/filtration.dart';

ValueNotifier<List<TransactionModel>> allUsers =
    ValueNotifier(TransactionDB.instance.transactionListNotifier.value);

class ViewListScreen extends StatefulWidget {
  const ViewListScreen({super.key});

  @override
  State<ViewListScreen> createState() => _ViewListScreenState();
}

class _ViewListScreenState extends State<ViewListScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    // List<TransactionModel> result = [];
    allUsers.value = TransactionDB.instance.transactionListNotifier.value;
    if (enteredKeyword.isEmpty) {
      // result = allUsers.value;
    } else {
      allUsers.value = allUsers.value
          .where((element) => element.category.name
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 45, 255),
        actions: [
          const FiltrationViewList(),
          PopupMenuButton(
            icon: const Icon(Icons.filter_list_outlined),
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
                  allUsers.value =
                      TransactionDB.instance.transactionListNotifier.value;
                  allUsers.value = allUsers.value
                      .where((element) =>
                          element.category.type == CategoryType.income)
                      .toList();
                }),
                child: const Text("Income"),
              ),
              PopupMenuItem(
                onTap: (() {
                  allUsers.value =
                      TransactionDB.instance.transactionListNotifier.value;
                  allUsers.value = allUsers.value
                      .where((element) =>
                          element.category.type == CategoryType.expense)
                      .toList();
                }),
                child: const Text("Expense"),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: TextField(
              onChanged: ((value) => _runFilter(value)),
              decoration: const InputDecoration(
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search_outlined),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(137, 27, 27, 27)))),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: ValueListenableBuilder(
                    valueListenable: allUsers,
                    builder: (context, users, _) {
                      return ValueListenableBuilder(
                        valueListenable:
                            TransactionDB.instance.transactionListNotifier,
                        builder: (BuildContext ctx,
                            List<TransactionModel> allUsers, Widget? _) {
                          TransactionDB.instance.refresh();
                          return users.isNotEmpty
                              ? ListView.builder(
                                  itemCount: users.length,
                                  itemBuilder: (context, index) {
                                    final _value = users[index];
                                    if (_value.id != null) {
                                      return Slidable(
                                        key: Key(_value.id!),
                                        startActionPane: ActionPane(
                                            motion: const BehindMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: (context) {
                                                  showDialog(
                                                      context: context,
                                                      builder: ((context) {
                                                        return AlertDialog(
                                                          content: const Text(
                                                              "DO you want to delete"),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    const Text(
                                                                        "No")),
                                                            TextButton(
                                                                onPressed: () {
                                                                  TransactionDB
                                                                      .instance
                                                                      .deleteTransaction(
                                                                          _value);
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    const Text(
                                                                        "Yes")),
                                                          ],
                                                        );
                                                      }));
                                                },
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 239, 247, 255),
                                                foregroundColor: Colors.red,
                                                icon: Icons.delete_outlined,
                                                label: "Delete",
                                              )
                                            ]),
                                        endActionPane: ActionPane(
                                            motion: const BehindMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: (ctx) {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: ((context) {
                                                    return EditTransactionScreen(
                                                      obj: _value,
                                                      id: _value.id,
                                                    );
                                                  })));
                                                },
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 239, 247, 255),
                                                foregroundColor: Colors.blue,
                                                icon: Icons.edit,
                                              )
                                            ]),
                                        child: Column(
                                          children: [
                                            Card(
                                              child: ListTile(
                                                leading: _value.category.type ==
                                                        CategoryType.income
                                                    ? const Icon(
                                                        Icons.arrow_upward,
                                                        color: Colors.blue,
                                                        size: 30,
                                                      )
                                                    : const Icon(
                                                        Icons.arrow_downward,
                                                        color: Color.fromARGB(
                                                            255, 255, 0, 55),
                                                        size: 30,
                                                      ),
                                                title: Text(
                                                  _value.category.name,
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                ),
                                                subtitle: Text(
                                                    parseDate(_value.date)),
                                                trailing: Text(
                                                  " ${_value.amount}",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black45,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return const Text("Value is null");
                                    }
                                  })
                              : Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          "asset/126320-empty-box3.gif"),
                                    ],
                                  ),
                                );
                        },
                      );
                    })),
          ),
        ],
      ),
    );
  }

  String parseDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }
}
