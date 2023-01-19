// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/db/transaction_db.dart';
import 'package:money_manager_app/models/category_modal.dart';
import 'package:money_manager_app/widgets/filtration.dart';

class ViewListScreen extends StatefulWidget {
  const ViewListScreen({super.key});

  @override
  State<ViewListScreen> createState() => _ViewListScreenState();
}

class _ViewListScreenState extends State<ViewListScreen> {
  late List<TransactionModel> searchResult;
  List<Map<String, dynamic>> _foundUsers = [];

  @override
  void initState() {
    super.initState();
  }

  void _runFilter(String enterKeyword) {
    List<Map<String, dynamic>> result = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FiltrationViewList(),
          IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 30)),
                  lastDate: DateTime.now(),
                );
              },
              icon: Icon(Icons.calendar_month_outlined)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: TextField(
              decoration: InputDecoration(
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
                  valueListenable:
                      TransactionDB.instance.transactionListNotifier,
                  builder: (BuildContext ctx, List<TransactionModel> newList,
                      Widget? _) {
                    return newList.isNotEmpty
                        ? ListView.builder(
                            itemCount: newList.length,
                            itemBuilder: (context, index) {
                              final _value = newList[index];
                              return Slidable(
                                key: Key(_value.id!),
                                startActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (ctx) {
                                          showDialog(
                                              context: context,
                                              builder: ((context) {
                                                return AlertDialog(
                                                  content: Text(
                                                      "DO you want to delete"),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          TransactionDB.instance
                                                              .deleteTransaction(
                                                                  _value.id!);
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text("Yes")),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text("No"))
                                                  ],
                                                );
                                              }));
                                        },
                                        foregroundColor: Colors.red,
                                        icon: Icons.delete_outlined,
                                        label: "Delete",
                                      )
                                    ]),
                                endActionPane: ActionPane(
                                    motion: BehindMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (ctx) {},
                                        icon: Icons.edit,
                                      )
                                    ]),
                                child: Column(
                                  children: [
                                    Card(
                                      child: ListTile(
                                        leading: _value.category.type ==
                                                CategoryType.income
                                            ? Icon(
                                                Icons.arrow_upward,
                                                color: Colors.blue,
                                                size: 30,
                                              )
                                            : Icon(
                                                Icons.arrow_downward,
                                                color: Color.fromARGB(
                                                    255, 255, 0, 55),
                                                size: 30,
                                              ),
                                        title: Text(
                                          _value.category.name,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        subtitle: Text(parseDate(_value.date)),
                                        trailing: Text(
                                          " ${_value.amount}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                        : Text("No result found");
                  },
                )),
          ),
        ],
      ),
    );
  }

  String parseDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }
}
