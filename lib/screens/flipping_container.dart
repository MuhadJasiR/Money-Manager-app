import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

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

  Widget build(BuildContext context) {
    return Container(
        child: FlipCard(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Positioned(
                    top: 175,
                    left: 50,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.monetization_on_outlined,
                          color: Colors.white,
                          size: 85,
                        ),
                        Text(
                          "Income",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "25000",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 175,
                left: 220,
                child: Column(
                  children: const [
                    Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.white,
                      size: 85,
                    ),
                    Text(
                      "Expenses",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "11200",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      back: Container(
        height: 210,
        width: 360,
        color: Colors.blue,
        child: Text("iam Muhammed Jasir ali"),
      ),
    ));
  }
}
