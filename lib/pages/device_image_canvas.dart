import 'dart:html';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/utils/image_material_item.dart';

import '../side_bar.dart';

/// 设备底图绘制，包含画布，素材展示，左边是画板，右边是素材库，选择素材
/// 直接拖动到画板，拼装素材

// ignore: must_be_immutable
class DeviceImageCanvas extends StatefulWidget {
  
  @override
  State<DeviceImageCanvas> createState() => _DeviceImageCanvasState();
}

typedef SelectedCallback = void Function(String imgUrl);

class _DeviceImageCanvasState extends State<DeviceImageCanvas> {


  static String selectedImgUrl = "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1486815995,1021386370&fm=224&gp=0.jpg";
 
  static final String _imgUrl = 'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg';

  static Image _image = Image.network(selectedImgUrl);

  List<ImageMaterialItem> imageMaterialList = [
    ImageMaterialItem(
      data: ImageMaterialItemViewModel(
          imgUrl: _imgUrl,
          title: '设备1',
          onClicked: (imgUrl){
            selectedImgUrl = imgUrl;
            _image = Image.network(imgUrl);
            print("设备1 url="+selectedImgUrl);
          }
        ),
    ),
    ImageMaterialItem(
      data: ImageMaterialItemViewModel(
          imgUrl: _imgUrl,
          title: '设备2',
          onClicked: (imgUrl){
            // setSelectedUrl(imgUrl);
            selectedImgUrl = imgUrl;
            _image = Image.network(imgUrl);
            print("设备2 url="+selectedImgUrl);
          }
        ),
    ),
    ImageMaterialItem(
      data: ImageMaterialItemViewModel(
          imgUrl: _imgUrl,
          title: '设备3',
          onClicked: (imgUrl){
            // setSelectedUrl(imgUrl);
            selectedImgUrl = imgUrl;
            _image = Image.network(imgUrl);
            print("设备3 url="+selectedImgUrl);
          }
        ),
    ),
    ImageMaterialItem(
      data: ImageMaterialItemViewModel(
          imgUrl: _imgUrl,
          title: '设备4',
          onClicked: (imgUrl){
            // setSelectedUrl(imgUrl);
            selectedImgUrl = imgUrl;
            _image = Image.network(imgUrl);
            print("设备4 url="+selectedImgUrl);
          }
        ),
    ),
    ImageMaterialItem(
      data: ImageMaterialItemViewModel(
          imgUrl: _imgUrl,
          title: '设备5',
          onClicked: (imgUrl){
            // setSelectedUrl(imgUrl);
            selectedImgUrl = imgUrl;
            _image = Image.network(imgUrl);
            print("设备5 url="+selectedImgUrl);          }
        ),
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
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
              child: _image,
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