// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:money_manager_app/screens/graph_page/expense_chart.dart';
import 'package:money_manager_app/screens/graph_page/income_chart.dart';
import 'package:money_manager_app/screens/graph_page/overview.dart';

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
      ),
      body: Column(
        children: [
          TabBar(
              controller: _tabController2,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
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
              child: TabBarView(
                  controller: _tabController2,
                  children: [OverviewChart(), Income_chart(), ExpensesChart()]))
        ],
      ),
    );
  }
}
