import 'package:flutter/material.dart';
import 'package:flutter_web/pages/login.dart';
import 'package:flutter_web/utils/cache_utils.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'flutter_amap_map/flutter_2d_amap.dart';
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

  bool _isLogin = false;

  _getLoginState() async {
    _isLogin = await CacheUtils.getLoginState();
  }

  @override
  void initState() {
    super.initState();
    // 判断是否登录
    _getLoginState();
    Flutter2dAMap.setApiKey(webKey: "cs_web_open_map");
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

    //_isLogin = true;

    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉Debug图标
      theme: ThemeData(
          brightness: Brightness.light, //亮暗模式 light明亮 dart暗黑
          primaryColor: Colors.indigo[200], //主色调 淡蓝
          accentColor: Colors.indigoAccent), //强调色
      onGenerateRoute: onGenerateRoute,
      home: !_isLogin
          ? LoginPage()
          : Scaffold(
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
