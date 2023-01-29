import 'package:flutter/material.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/db/transaction_db.dart';
import 'package:money_manager_app/widgets/total_income_calculation.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

ValueNotifier<List<TransactionModel>> doughnutChartNotifier =
    ValueNotifier(TransactionDB.instance.transactionListNotifier.value);

class OverviewChart extends StatefulWidget {
  const OverviewChart({super.key});

  @override
  State<OverviewChart> createState() => _OverviewChartState();
}

class _OverviewChartState extends State<OverviewChart> {
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: doughnutChartNotifier,
        builder: (context, value, _) {
          Map incomeMap = {"name": "Income", "amount": incomeTotal.value};
          Map expenseMap = {"name": "Expense", "amount": expenseTotal.value};
          List<Map> dataList = [incomeMap, expenseMap];
          return value.isEmpty
              ? Container(
                  height: 20,
                  child: Image.asset("asset/25943-nodata.gif", height: 30),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SfCircularChart(
                      //   title: ChartTitle(text: 'Statistics'),
                      legend: Legend(
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.scroll),
                      tooltipBehavior: _tooltipBehavior,
                      series: <CircularSeries>[
                        PieSeries<Map, String>(
                          dataSource: dataList,
                          xValueMapper: (Map data, _) => data['name'],
                          yValueMapper: (Map data, _) => data['amount'],
                          enableTooltip: true,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true),
                        )
                      ],
                    ),
                  ],
                );
        });
  }
}
