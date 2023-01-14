// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FinancialChart extends StatefulWidget {
  const FinancialChart({super.key});

  @override
  State<FinancialChart> createState() => _FinancialChartState();
}

class _FinancialChartState extends State<FinancialChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Financial Chart"),
        centerTitle: true,
      ),
    );
  }
}
