import 'package:flutter/material.dart';
import 'package:flutter_web/side_bar.dart';

class StationMapPage extends StatefulWidget {
  @override
  _StationMapPageState createState() => _StationMapPageState();
}

class _StationMapPageState extends State<StationMapPage> {
  double progress = 0;
  String url = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '污水处理在线监测平台',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: 1000.0,
        height: 100.0,
        child: Center(
          child: Text(
            '欢迎来到站点地图',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      drawer: Builder(
        builder: (context) => Drawer(
          child: SideBar(),
        ),
      ),
    );
  }
}
