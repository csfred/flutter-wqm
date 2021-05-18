import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/utils/image_material_item.dart';

import '../side_bar.dart';

/// 设备底图绘制，包含画布，素材展示，左边是画板，右边是素材库，选择素材
/// 直接拖动到画板，拼装素材

// ignore: must_be_immutable
class DeviceImageCanvas extends StatefulWidget {

  late _DeviceImageCanvasState canvasState = _DeviceImageCanvasState(this);

  late String _selectImgUrl = '';

  void setSelectImgUrl(String imgUrl){
   this. _selectImgUrl = imgUrl;
  }
  
  @override
  _DeviceImageCanvasState createState() => canvasState;
}

class _DeviceImageCanvasState extends State<DeviceImageCanvas> {

  late DeviceImageCanvas _deviceImageCanvas;

 
  static final String _imgUrl = 'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg';

  

  _DeviceImageCanvasState(DeviceImageCanvas deviceImageCanvas){
    _deviceImageCanvas = deviceImageCanvas;
  }

  List<ImageMaterialItem> imageMaterialList = [
    ImageMaterialItem(
      data: ImageMaterialItemViewModel(
          imgUrl: _imgUrl,
          title: '设备1',
          ),
    ),
    ImageMaterialItem(
      data: ImageMaterialItemViewModel(
          imgUrl: _imgUrl,
          title: '设备2'
          ),
    ),
    ImageMaterialItem(
      data: ImageMaterialItemViewModel(
          imgUrl: _imgUrl,
          title: '设备3'
          ),
    ),
    ImageMaterialItem(
      data: ImageMaterialItemViewModel(
          imgUrl: _imgUrl,
          title: '设备5'
          ),
    ),
    ImageMaterialItem(
      data: ImageMaterialItemViewModel(
          imgUrl: _imgUrl,
          title: '设备6'
          ),
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    for (ImageMaterialItem item in imageMaterialList) {
      item.setDeviceImageCanvas(_deviceImageCanvas);
    }
   return Scaffold(
      appBar: AppBar(
        title: Text(
          '污水处理在线监测平台 / 设备底图绘制',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            //画布区域
            Container(
              width: 1000,
              child: Text('画布'),
            ),
            Divider(height: 10, color: Colors.lightGreen,),
            //素材展示区域
            Expanded(
              child: Container(
                  width: 100,
                  child: GridView.count(
                      padding: EdgeInsets.symmetric(vertical: 0.5),
                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 3,
                      // ),
                      crossAxisCount: 3,
                      //滚动方向
                      scrollDirection: Axis.vertical,
                      // 左右间隔
                      crossAxisSpacing: 10,
                      // 上下间隔
                      mainAxisSpacing: 1.0,
                      //宽高比
                      childAspectRatio: 1,

                      children: imageMaterialList,
                    ),
                )
            ),
          ]
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

