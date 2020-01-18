import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;


class DonutAutoLabelChart extends StatefulWidget {

  final List<charts.Series> seriesList;
  final bool animate;

  DonutAutoLabelChart(this.seriesList, {this.animate});

  factory DonutAutoLabelChart.withSampleData() {
    return new DonutAutoLabelChart(
      _createSampleData(),
      animate: false,
    );
  }

  static List<charts.Series<LinearSales, dynamic>> _createSampleData() {
    final data = [
      new LinearSales('余量', 800, Colors.green),
      new LinearSales('今天', 50, Colors.orange),
      new LinearSales('已用', 150, Colors.red),
    ];

    return [
      new charts.Series<LinearSales, dynamic>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        colorFn: (LinearSales sales, _) => sales.color,
        data: data,
      )
    ];
  }

  @override
  _DonutAutoLabelChartState createState() => _DonutAutoLabelChartState();
}

// 饼图
class _DonutAutoLabelChartState extends State<DonutAutoLabelChart> {

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      widget.seriesList,
      animate: widget.animate,
      behaviors: [
        new charts.DatumLegend(
          position: charts.BehaviorPosition.end,
          horizontalFirst: false,
          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
          showMeasures: true,
          legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
          measureFormatter: (num value) {
            return value == null ? '-' : '${value}L';
          },
        ),
      ],
    );
  }

}

/// 数据模型
class LinearSales {
  final dynamic year;
  final dynamic sales;
  final charts.Color color;
  // LinearSales(this.year, this.sales, this.color);
  LinearSales(this.year, this.sales, Color color)
      : this.color = new charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}