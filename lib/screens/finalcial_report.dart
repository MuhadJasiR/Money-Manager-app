import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Financial chart"),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.filter_list_rounded),
              itemBuilder: ((context) => [
                    PopupMenuItem(
                        onTap: (() {
                          doughnutChartNotifier.value = TransactionDB
                              .instance.transactionListNotifier.value;
                        }),
                        child: const Text("All")),
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
                        child: const Text("Today")),
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
                        child: const Text("Yesterday")),
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
                        child: const Text("This month")),
                  ]))
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 35, 45, 255),
            ),
            child: TabBar(
                controller: _tabController2,
                unselectedLabelColor: Colors.white,
                labelColor: const Color.fromARGB(255, 35, 45, 255),
                indicatorWeight: 2,
                indicator: BoxDecoration(
                    color: const Color.fromARGB(255, 149, 204, 255),
                    borderRadius: BorderRadius.circular(2)),
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
          ),
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
