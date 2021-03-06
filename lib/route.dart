import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_web/pages/device_image_canvas.dart';
import 'package:flutter_web/pages/home.dart';

import 'pages/device_info.dart';
import 'pages/device_list.dart';
import 'pages/report.dart';
import 'pages/station_edit.dart';
import 'pages/station_map.dart';
import 'pages/user_manage.dart';

final routes = {
  '/Home': (context) => HomePage(), //首页
  '/StationMap': (context) => StationMapPage(), //站点地图
  '/StationEdit': (context) => StationEditPage(), //站点编辑
  '/DeviceInfo': (context) => DeviceInfoPage(), //设备新增信息，修改
  '/ListDevice': (context) => DeviceListPage(), //设备列表
  '/DeviceImageCanvas': (context) => DeviceImageCanvas(), //设备底图绘制
  '/Report': (context) => ReportPage(), //报表
  '/UserManage': (context) => UserManagePage(), //用户管理
};

// ignore: top_level_function_literal_block
// ignore: missing_return
// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name!;
  final Function pageContentBuilder = routes[name]!;
  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  } else {
    final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
};
