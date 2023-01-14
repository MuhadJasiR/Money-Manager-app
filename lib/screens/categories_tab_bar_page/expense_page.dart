import 'package:flutter/material.dart';

class ExpenseScreenPage extends StatelessWidget {
  const ExpenseScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
          ),
          itemCount: 3,
          itemBuilder: ((context, index) {
            return Container(
              height: 20,
              width: 40,
              color: Colors.black,
              // child: Card(
              //   color: Color.fromARGB(255, 45, 35, 255),
              // ),
            );
          })),
    );
  }
}
