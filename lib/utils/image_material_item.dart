import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageMaterialItem extends StatelessWidget {
  final ImageMaterialItemViewModel data;


  ImageMaterialItem({Key? key,  required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        //处理点击事件
        //print("image url = "+ this.data.imgUrl);
        this.data.onClicked(this.data.imgUrl);
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

typedef SelectedCallback = void Function(String imgUrl);

class ImageMaterialItemViewModel {

  /// 标题
  late final String title;

  ///图片资源路径
  late final String imgUrl;

  late SelectedCallback onClicked;

  ImageMaterialItemViewModel({
    required this.imgUrl,
    required this.title,
    required this.onClicked(imgUrl),
  });
}