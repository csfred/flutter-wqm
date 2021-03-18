import 'package:flutter/material.dart';
import 'package:flutter_web/side_bar.dart';

class DeviceOptPage extends StatefulWidget {
  @override
  _DeviceOptPageState createState() => _DeviceOptPageState();
}

class _DeviceOptPageState extends State<DeviceOptPage> {
  double progress = 0;
  String url = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '污水处理在线监测平台 / 设备操作',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: 1000.0,
        height: 100.0,
        child: Center(
          child: Text(
            '欢迎来到操作设备',
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
