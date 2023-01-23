// ignore_for_file: prefer_const_constructors

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
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
    return FlipCard(
      direction: FlipDirection.VERTICAL,
      flipOnTouch: true,
      controller: flipCardController,
      front: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 47, 137, 255),
        ),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          height: 210,
          width: 360,
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.arrow_circle_up_sharp,
                          color: Colors.white,
                          size: 75,
                        ),
                        Text(
                          "Income",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        ValueListenableBuilder(
                            valueListenable: incomeTotal,
                            builder: ((context, value, _) {
                              return Text(
                                incomeTotal.value.toString(),
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              );
                            }))
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.arrow_circle_down,
                      color: Colors.white,
                      size: 75,
                    ),
                    Text(
                      "Expenses",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    ValueListenableBuilder(
                        valueListenable: expenseTotal,
                        builder: ((context, value, _) {
                          return Text(
                            expenseTotal.value.toString(),
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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
        height: 210,
        width: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text("Coming soon.."),
        ),
      ),
    );
  }
}
