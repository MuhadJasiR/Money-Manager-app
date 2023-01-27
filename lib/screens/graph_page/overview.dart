import 'package:flutter/material.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/db/transaction_db.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewChart extends StatefulWidget {
  const OverviewChart({super.key});

  @override
  State<OverviewChart> createState() => _OverviewChartState();
}

class _OverviewChartState extends State<OverviewChart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        child: SfCircularChart(
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          series: <CircularSeries>[
            DoughnutSeries<TransactionModel, String>(
                innerRadius: "105",
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
