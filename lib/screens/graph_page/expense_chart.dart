import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ExpensesChart extends StatefulWidget {
  const ExpensesChart({super.key});

  @override
  State<ExpensesChart> createState() => _ExpensesChartState();
}

class _ExpensesChartState extends State<ExpensesChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularPercentIndicator(
            radius: 100,
            lineWidth: 20,
            percent: 0.4,
            progressColor: Colors.deepPurple,
            backgroundColor: Colors.deepPurple.shade100,
            circularStrokeCap: CircularStrokeCap.round,
            center: const Text(
              "Rs 19987",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: LinearPercentIndicator(
              barRadius: Radius.circular(10),
              lineHeight: 20,
              percent: 0.6,
              progressColor: Colors.deepPurple,
              backgroundColor: Colors.deepPurple[100],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: LinearPercentIndicator(
              barRadius: Radius.circular(10),
              lineHeight: 20,
              percent: 0.6,
              progressColor: Colors.deepPurple,
              backgroundColor: Colors.deepPurple[100],
            ),
          ),
        ],
      ),
    );
  }
}
