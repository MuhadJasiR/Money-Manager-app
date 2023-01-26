// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FinancialChart extends StatefulWidget {
  const FinancialChart({super.key});

  @override
  State<FinancialChart> createState() => _FinancialChartState();
}

class _FinancialChartState extends State<FinancialChart> {
  late List<GDPData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Financial Chart"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          child: SfCircularChart(
            legend: Legend(
                isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            series: <CircularSeries>[
              DoughnutSeries<GDPData, String>(
                  dataSource: _chartData,
                  xValueMapper: (GDPData data, _) => data.continent,
                  yValueMapper: (GDPData data, _) => data.gdp,
                  dataLabelSettings: DataLabelSettings(isVisible: true)),
            ],
          ),
        ),
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData("Oceania", 1000),
      GDPData("Arica", 2490),
      GDPData("s America", 2900),
      GDPData("Europe", 23050),
      GDPData("n America", 24800),
      GDPData("Asia", 34390),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
