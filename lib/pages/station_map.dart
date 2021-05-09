import 'package:flutter/material.dart';
import 'package:flutter_web/flutter_amap_map/amap_2d_view.dart';
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
          '污水处理在线监测平台 / 站点地图',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(10.0),
          width: 2000,
          height: 900,
          child: AMap2DView(
            onPoiSearched: (result) {},
            onAMap2DViewCreated: (controller) {
              //定位
              //controller.location();
              //检索地点
              controller.search('雅逸新城', city: '西安');
            },
          )
      ),
      drawer: Builder(
        builder: (context) => Drawer(
          child: SideBar(),
        ),
      ),
    );
  }
}
