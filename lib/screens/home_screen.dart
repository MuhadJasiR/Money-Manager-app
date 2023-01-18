// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:money_manager_app/db/category_db.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/db/transaction_db.dart';
import 'package:money_manager_app/models/category_modal.dart';
import 'package:money_manager_app/screens/flipping_container.dart';
import 'package:money_manager_app/screens/view_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDB.instance.refreshUi();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 239, 247, 255),
        body: Column(
          children: [
            SizedBox(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 35, 43, 255),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "THURSDAY 5\nJANUARY",
                          style: TextStyle(
                              color: Color.fromARGB(255, 212, 212, 212),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 220),
                        child: Text(
                          "Jasir Ali ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 212, 212, 212),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 115,
                    top: 70,
                    child: Column(
                      children: const [
                        Text(
                          "Account Balance",
                          style: TextStyle(
                              color: Color.fromARGB(255, 212, 212, 212),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "\u{20B9} ${9400.0}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        )
                      ],
                    ),
                  ),
                  Positioned(left: 23.5, top: 160, child: FlippingContainer()),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25, top: 125, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Transaction",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) {
                              return ViewListScreen();
                            }));
                          },
                          child: Text("View All"))
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: ValueListenableBuilder(
                    valueListenable:
                        TransactionDB.instance.transactionListNotifier,
                    builder: (BuildContext ctx, List<TransactionModel> newList,
                        Widget? _) {
                      return ListView.builder(
                          itemCount: newList.length,
                          itemBuilder: (context, index) {
                            final _value = newList[index];
                            return Column(
                              children: [
                                Card(
                                  child: ListTile(
                                    leading: _value.type == CategoryType.income
                                        ? Icon(
                                            Icons.arrow_upward,
                                            color: Colors.blue,
                                            size: 30,
                                          )
                                        : Icon(
                                            Icons.arrow_downward,
                                            color:
                                                Color.fromARGB(255, 255, 0, 55),
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
                            );
                          });
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }

  String parseDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }
}
