// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:money_manager_app/screens/add_screen.dart';
import 'package:money_manager_app/screens/categories.dart';
import 'package:money_manager_app/screens/finalcial_report.dart';
import 'package:money_manager_app/screens/home_screen.dart';
import 'package:money_manager_app/screens/settings.dart';
import 'package:money_manager_app/widgets/category_add_popup.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(BuildContext context, {super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavBar> {
  // static ValueNotifier<int> selectIndexNotifier = ValueNotifier(0);
  int currentTab = 0;
  final List<Widget> screens = [
    HomeScreen(),
    Categories(),
    FinancialChart(),
    SettingScreen()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (currentTab == 0) {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return AddTransaction();
              })));
            } else {
              showCategoryAddPopup(context);
              // print("add category");
              // final _sample = CategoryModel(
              //   id: DateTime.now().microsecondsSinceEpoch.toString(),
              //   name: "travel",
              //   type: CategoryType.expense,
              // );
              // CategoryDB().insertCategory(_sample);
            }
          },
          // ignore: sort_child_properties_last
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 35, 43, 255),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          // ignore: sized_box_for_whitespace
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = HomeScreen();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            size: 40,
                            color: currentTab == 0
                                ? Color.fromARGB(255, 35, 43, 255)
                                : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Categories();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.category_outlined,
                            size: 40,
                            color: currentTab == 1
                                ? Color.fromARGB(255, 35, 43, 255)
                                : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = FinancialChart();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.donut_large_rounded,
                            size: 40,
                            color: currentTab == 2
                                ? Color.fromARGB(255, 35, 43, 255)
                                : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = SettingScreen();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            size: 40,
                            color: currentTab == 3
                                ? Color.fromARGB(255, 35, 43, 255)
                                : Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
