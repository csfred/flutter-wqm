import 'package:flutter/material.dart';
import 'package:flutter_web/side_bar.dart';

class StationEditPage extends StatefulWidget {
  @override
  _StationEditPageState createState() => _StationEditPageState();
}

class _StationEditPageState extends State<StationEditPage> {
  double progress = 0;
  String url = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '污水处理在线监测平台 / 站点编辑',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: 1000.0,
        height: 100.0,
        child: Center(
          child: Text(
            '欢迎来到站点编辑',
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
