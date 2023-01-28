import 'package:flutter/material.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/db/transaction_db.dart';
import 'package:money_manager_app/models/category_modal.dart';
import 'package:money_manager_app/screens/finalcial_report.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Income_chart extends StatefulWidget {
  const Income_chart({super.key});

  @override
  State<Income_chart> createState() => _Income_chartState();
}

class _Income_chartState extends State<Income_chart> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: doughnutChartNotifier,
        builder: ((context, value, _) {
          var allIncomeData = value
              .where((element) => element.category.type == CategoryType.income)
              .toList();
          return allIncomeData.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Nothing Found")],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SfCircularChart(
                      legend: Legend(
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.wrap),
                      series: <CircularSeries>[
                        DoughnutSeries<TransactionModel, String>(
                            // innerRadius: "105",
                            dataSource: allIncomeData,
                            xValueMapper: (TransactionModel data, _) =>
                                data.category.name,
                            yValueMapper: (TransactionModel data, _) =>
                                data.amount,
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true)),
                      ],
                    ),
                  ],
                );
        }));
  }
}
