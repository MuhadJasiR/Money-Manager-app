// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/db/transaction_db.dart';
import 'package:money_manager_app/screens/graph_page/expense_chart.dart';
import 'package:money_manager_app/screens/graph_page/income_chart.dart';
import 'package:money_manager_app/screens/graph_page/overview.dart';

ValueNotifier<List<TransactionModel>> doughnutChartNotifier =
    ValueNotifier(TransactionDB.instance.transactionListNotifier.value);

class FinancialChart extends StatefulWidget {
  const FinancialChart({super.key});

  @override
  State<FinancialChart> createState() => _FinancialChartState();
}

class _FinancialChartState extends State<FinancialChart>
    with SingleTickerProviderStateMixin {
  late TabController _tabController2;

  @override
  void initState() {
    _tabController2 = TabController(length: 3, vsync: this);
    doughnutChartNotifier.value =
        TransactionDB.instance.transactionListNotifier.value;

    super.initState();
  }

  @override
  // void initState() {
  //   _chartData = getChartData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Financial chart"),
        actions: [
          PopupMenuButton(
              itemBuilder: ((context) => [
                    PopupMenuItem(
                        onTap: (() {
                          doughnutChartNotifier.value = TransactionDB
                              .instance.transactionListNotifier.value;
                        }),
                        child: Text("All")),
                    PopupMenuItem(
                        onTap: (() {
                          doughnutChartNotifier.value = TransactionDB
                              .instance.transactionListNotifier.value;

                          doughnutChartNotifier.value = doughnutChartNotifier
                              .value
                              .where((element) =>
                                  element.date.day == DateTime.now().day &&
                                  element.date.month == DateTime.now().month &&
                                  element.date.year == DateTime.now().year)
                              .toList();
                        }),
                        child: Text("Today")),
                    PopupMenuItem(
                        onTap: (() {
                          doughnutChartNotifier.value = TransactionDB
                              .instance.transactionListNotifier.value;

                          doughnutChartNotifier.value = doughnutChartNotifier
                              .value
                              .where((element) =>
                                  element.date.day == DateTime.now().day - 1 &&
                                  element.date.month == DateTime.now().month &&
                                  element.date.year == DateTime.now().year)
                              .toList();
                        }),
                        child: Text("Yesterday")),
                    PopupMenuItem(
                        onTap: (() {
                          doughnutChartNotifier.value = TransactionDB
                              .instance.transactionListNotifier.value;

                          doughnutChartNotifier.value = doughnutChartNotifier
                              .value
                              .where((element) =>
                                  element.date.month == DateTime.now().month &&
                                  element.date.year == DateTime.now().year)
                              .toList();
                        }),
                        child: Text("Month")),
                  ]))
        ],
      ),
      body: Column(
        children: [
          TabBar(
              controller: _tabController2,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(
                  text: "Overview",
                ),
                Tab(
                  text: "Income",
                ),
                Tab(
                  text: "Expense",
                )
              ]),
          Expanded(
              child: TabBarView(controller: _tabController2, children: const [
            OverviewChart(),
            Income_chart(),
            ExpensesChart()
          ]))
        ],
      ),
    );
  }
}
