import 'package:flutter/material.dart';
import 'package:flutter_web/side_bar.dart';

class UserManagePage extends StatefulWidget {
  @override
  _UserManagePageState createState() => _UserManagePageState();
}

class _UserManagePageState extends State<UserManagePage> {
  double progress = 0;
  String url = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '污水处理在线监测平台 / 用户管理',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: 1000.0,
        height: 100.0,
        child: Center(
          child: Text(
            '欢迎来到用户管理',
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
