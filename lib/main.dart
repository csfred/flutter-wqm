import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'side_bar.dart';
import 'route.dart';
//import './utils/responsive_widget.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /**
     * ScreenUtil 屏幕自适应工具，等比适配
     */
    //ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉Debug图标
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.indigo[200],
          accentColor: Colors.indigoAccent),
      onGenerateRoute: onGenerateRoute,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '污水处理在线监测平台',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Container(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1024, vertical: 768),
        )),
        drawer: Builder(
          builder: (context) => Drawer(
            child: SideBar(),
          ),
        ),
      ),
    );
  }
}
