import 'package:flutter/material.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/db/transaction_db.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Income_chart extends StatefulWidget {
  const Income_chart({super.key});

  @override
  State<Income_chart> createState() => _Income_chartState();
}

class _Income_chartState extends State<Income_chart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 400,
        child: SfCircularChart(
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          series: <CircularSeries>[
            DoughnutSeries<TransactionModel, String>(
                dataSource:
                    TransactionDB.instance.transactionListNotifier.value,
                xValueMapper: (TransactionModel data, _) => data.category.name,
                yValueMapper: (TransactionModel data, _) => data.amount,
                dataLabelSettings: DataLabelSettings(isVisible: true)),
          ],
        ),
      ),
    );
  }
}
