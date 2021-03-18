import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LinearSales {
  final String title;

  final int sales;

  final Color color;

  charts.Color chartsColor;

  factory LinearSales(String title, int sales, Color color) {
    LinearSales linearSales = LinearSales._internal(title, sales, color);
    linearSales.chartsColor = charts.ColorUtil.fromDartColor(color);
    return linearSales;
  }

  // ignore: unused_element
  LinearSales._internal(this.title, this.sales, this.color);
}

/// 饼图
class PieCharts extends StatelessWidget {
  final double _width;
  final double _height;
  final bool animate;

  final List<LinearSales> _dataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      child: _buildPieChatWidget(),
    );
  }

  PieCharts(this._width, this._height, this.animate, this._dataList);

  /// 构建饼状图
  Widget _buildPieChatWidget() {
    List<charts.Series> seriesList = _createSampleData(_dataList);
    return charts.PieChart(
      seriesList,
      animate: this.animate,
      defaultRenderer: new charts.ArcRendererConfig(
        arcWidth: 60,
        arcRendererDecorators: [new charts.ArcLabelDecorator()],
      ),
    );
  }

  static List<charts.Series<LinearSales, String>> _createSampleData(
      List<LinearSales> dataList) {
    return [
      new charts.Series<LinearSales, String>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.title,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: dataList,
        colorFn: (LinearSales sales, _) => sales.chartsColor,
        //设置饼图显示标签 Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.title}: ${row.sales}',
      )
    ];
  }
}
