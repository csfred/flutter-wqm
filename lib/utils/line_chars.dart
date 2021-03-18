import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TimeSeriesSales {
  final DateTime timeCurrent;
  final DateTime timePrevious;
  final DateTime timeTarget;
  final int sales;

  TimeSeriesSales(
      {this.timeCurrent, this.timePrevious, this.timeTarget, this.sales});
}

/// 时间折线图
class TimeLineCharts extends StatelessWidget {
  final double _width;
  final double _height;
  final bool _animate;

  final Map<String, List<TimeSeriesSales>> _dataMapList = {
    "data": [
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 9, 19), sales: 5),
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 9, 26), sales: 25),
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 10, 3), sales: 100),
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 10, 10), sales: 75),
    ],
    "hitch": [
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 9, 19), sales: 10),
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 9, 26), sales: 50),
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 10, 3), sales: 200),
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 10, 10), sales: 150),
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      child: _buildTimeLineChatWidget(),
    );
  }

  TimeLineCharts(this._width, this._height, this._animate);

  Widget _buildTimeLineChatWidget() {
    List<charts.Series> seriesList = _createSampleData(_dataMapList);
    return charts.LineChart(
      seriesList,
      animate: _animate,
      // Custom renderer configuration for the point series.
      customSeriesRenderers: [
        new charts.SymbolAnnotationRendererConfig(
            // ID used to link series to this renderer.
            customRendererId: 'customSymbolAnnotation')
      ],
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      defaultRenderer: charts.LineRendererConfig(
        // 折线图绘制的配置
        includeArea: true,
        includePoints: true,
        includeLine: true,
        stacked: false,
      ),
    );
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData(
      Map<String, List<TimeSeriesSales>> dataMapList) {
    List<charts.Series<TimeSeriesSales, DateTime>> retChartList =
        <charts.Series<TimeSeriesSales, DateTime>>[];

    dataMapList.forEach((key, value) {
      charts.Series<TimeSeriesSales, DateTime> item =
          charts.Series<TimeSeriesSales, DateTime>(
        id: key,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.timeCurrent,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: value,
      );
      retChartList.add(item);
    });
    return retChartList;
  }
}
