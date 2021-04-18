import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter_web/flutter_amap_map/flutter_2d_amap.dart';
import 'package:flutter_web/side_bar.dart';

import '../utils/pie_chars.dart';
import '../utils/line_chars.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var statisData = {
    "stateNum": 3,
    "deviceNum": 50,
    "handleScale": "50立方米",
    "hitchNum": 1
  };

  ///饼图初始数据
  final List<LinearSales> pieDataList = [
    LinearSales("生活费", 200, Colors.lightBlueAccent),
    LinearSales("游玩费", 200, Colors.deepOrangeAccent),
    LinearSales("交通费", 400, Colors.green),
    LinearSales("贷款费", 300, Colors.amber),
    LinearSales("电话费", 200, Colors.orange)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '污水处理在线监测平台 / 首页',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: _buildHomeWidget(),
      drawer: Builder(
        builder: (context) => Drawer(
          child: SideBar(),
        ),
      ),
    );
  }

  /// 构建主界面
  Widget _buildHomeWidget() {
    return Column(
        //纵向显示 统计量  折线图  图表（雷达图，饼状图，柱状图）
        children: <Widget>[
          Divider(),
          _buildStatisWidget(),
          Divider(),
          //PieCharts(380, 150, true, pieDataList),
          //Divider(),
          //TimeLineCharts(300, 300, true),
          //FlutterMap(),
          Container(
            width: 1000,
            height: 500,
            child:AMap2DView(
            onPoiSearched: (result) {
            },
            onAMap2DViewCreated: (controller) {
            },
          )),
          
        ]);
  }

  ///构建统计量
  Widget _buildStatisWidget() {
    String jsonString = convert.jsonEncode(statisData);
    Map<String, dynamic> statisMap = convert.jsonDecode(jsonString);

    return Container(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              '站点数\n' + statisMap["stateNum"].toString(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // 显示不完，就在后面显示点点
              style: TextStyle(
                fontSize: 30.0, // 文字大小
                color: Colors.lightBlue, // 文字颜色
              ),
            ),
            Text(
              '设备数\n' + statisMap["deviceNum"].toString(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlue,
              ),
            ),
            Text(
              '处理规模\n' + statisMap["handleScale"].toString(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlue,
              ),
            ),
            Text(
              '故障数\n' + statisMap["hitchNum"].toString(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlue,
              ),
            )
          ],
        ));
  }
}
