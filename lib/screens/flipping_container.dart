import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:money_manager_app/screens/finalcial_report.dart';
import 'package:money_manager_app/widgets/total_income_calculation.dart';

class FlippingContainer extends StatefulWidget {
  const FlippingContainer({super.key});

  @override
  State<FlippingContainer> createState() => _FlippingContainerState();
}

class _FlippingContainerState extends State<FlippingContainer> {
  late FlipCardController flipCardController;
  @override
  void initState() {
    super.initState();
    flipCardController = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FlipCard(
        direction: FlipDirection.VERTICAL,
        flipOnTouch: true,
        controller: flipCardController,
        front: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 47, 137, 255),
          ),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            height: 210,
            width: size.width > size.height ? size.width / 2 : size.width - 40,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.arrow_circle_up_sharp,
                            color: Colors.white,
                            size: 75,
                          ),
                          const Text(
                            "Income",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          ValueListenableBuilder(
                              valueListenable: incomeTotal,
                              builder: ((context, value, _) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    incomeTotal.value.toString(),
                                    style: const TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }))
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.arrow_circle_down,
                        color: Colors.white,
                        size: 75,
                      ),
                      const Text(
                        "Expenses",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      ValueListenableBuilder(
                          valueListenable: expenseTotal,
                          builder: ((context, value, _) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                expenseTotal.value.toString(),
                                style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 47, 137, 255),
          ),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            height: 210,
            width: 360,
            child: ValueListenableBuilder(
                valueListenable: doughnutChartNotifier,
                builder: (context, value, _) {
                  Map incomeMap = {
                    "name": "Income",
                    "amount": incomeTotal.value
                  };
                  Map expenseMap = {
                    "name": "Expense",
                    "amount": expenseTotal.value
                  };
                  List<Map> dataList = [incomeMap, expenseMap];
                  return value.isEmpty
                      ? const Center(
                          child: Text(
                          "No data",
                          selectionColor: Colors.white,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ))
                      : Column();
                }),
          ),
        ));
  }
}
