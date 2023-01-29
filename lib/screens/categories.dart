// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:money_manager_app/db/category_db.dart';
import 'package:money_manager_app/models/category_modal.dart';
import 'package:money_manager_app/screens/categories_tab_bar_page/expense_page.dart';
import 'package:money_manager_app/screens/categories_tab_bar_page/income_page.dart';
import 'package:money_manager_app/widgets/category_add_popup.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentTab = 0;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshUi();
    _tabController.addListener(() {
      selectedCategoryNotifier.value = _tabController.index == 0
          ? CategoryType.income
          : CategoryType.expense;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Categories"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 35, 45, 255),
              ),
              child: TabBar(
                unselectedLabelColor: Colors.white,
                labelColor: Color.fromARGB(255, 35, 45, 255),
                controller: _tabController,
                indicatorWeight: 2,
                indicator: BoxDecoration(
                    color: Color.fromARGB(255, 149, 204, 255),
                    borderRadius: BorderRadius.circular(20)),
                tabs: const [
                  Tab(
                    text: "INCOME",
                  ),
                  Tab(text: "EXPENSE"),
                ],
                // onTap: (value) {
                //   selectedCategoryNotifier.value = _tabController.index == 0
                //       ? CategoryType.income
                //       : CategoryType.expense;
                // },
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                IncomePageScreen(),
                ExpenseScreenPage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
