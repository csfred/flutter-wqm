import 'package:flutter/material.dart';
import 'package:flutter_web/pages/device_image_canvas.dart';

// ignore: must_be_immutable
class ImageMaterialItem extends StatelessWidget {
  final ImageMaterialItemViewModel data;

  late DeviceImageCanvas deviceImageCanvas;

  ImageMaterialItem({Key? key,  required this.data}) : super(key: key);

  void setDeviceImageCanvas(DeviceImageCanvas imageCanvas){
    this.deviceImageCanvas = imageCanvas;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        //处理点击事件
        //print("image url = "+ this.data.imgUrl);
        deviceImageCanvas.setSelectImgUrl(this.data.imgUrl);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 5),
        child: Column(
          children: <Widget>[
            SizedBox(height:20),
            Image.network(this.data.imgUrl),
            //Expanded(child: this.data.image),
            SizedBox(height:5),
            Text(
              this.data.title,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF333333),
              ),
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   alignment: Alignment.center,
    //   padding: EdgeInsets.only(bottom: 5),
    //   child: Column(
    //     children: <Widget>[
    //       SizedBox(height:20),
    //       this.data.image,
    //       //Expanded(child: this.data.image),
    //       SizedBox(height:5),
    //       Text(
    //         this.data.title,
    //         style: TextStyle(
    //           fontSize: 13,
    //           color: Color(0xFF333333),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class ImageMaterialItemViewModel {

  /// 标题
  late final String title;

  ///图片资源路径
  late final String imgUrl;

  ImageMaterialItemViewModel({
    required this.imgUrl,
    required this.title,
  });
}