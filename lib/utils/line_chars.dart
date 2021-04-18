import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:charts_flutter/flutter.dart' as charts;

class TimeSeriesSales {
  final DateTime timeCurrent;
  final DateTime timePrevious;
  final DateTime timeTarget;
  final int sales;

  TimeSeriesSales(
      {required this.timeCurrent, required this.timePrevious, required this.timeTarget, required this.sales});
}

/// 时间折线图
class TimeLineCharts extends StatelessWidget {
  final double _width;
  final double _height;
  final bool _animate;

  final Map<String, List<TimeSeriesSales>> _dataMapList = {
    "data": [
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 9, 19), sales: 5, timePrevious: new DateTime(2017, 9, 19), timeTarget: new DateTime(2017, 9, 19)),
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 9, 26), sales: 25, timePrevious: new DateTime(2017, 9, 26), timeTarget: new DateTime(2017, 9, 26)),
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 10, 3), sales: 100, timePrevious: new DateTime(2017, 10, 3), timeTarget: new DateTime(2017, 10, 3)),
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 10, 10), sales: 75, timePrevious: new DateTime(2017, 10, 10), timeTarget: new DateTime(2017, 10, 10)),
    ],
    "hitch": [
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 9, 19), sales: 10, timePrevious: new DateTime(2017, 9, 19), timeTarget: new DateTime(2017, 9, 19)),
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 9, 26), sales: 50, timePrevious: new DateTime(2017, 9, 26), timeTarget: new DateTime(2017, 9, 26)),
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 10, 3), sales: 200, timePrevious: new DateTime(2017, 10, 3), timeTarget: new DateTime(2017, 10, 3)),
      new TimeSeriesSales(timeCurrent: new DateTime(2017, 10, 10), sales: 150, timePrevious: new DateTime(2017, 10, 10), timeTarget: new DateTime(2017, 10, 10)),
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
