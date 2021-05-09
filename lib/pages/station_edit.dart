import 'package:flutter/material.dart';

class StationEditPage extends StatefulWidget {
  @override
  _StationEditPageState createState() => _StationEditPageState();
}

class _StationEditPageState extends State<StationEditPage> {
  double progress = 0;
  String url = "";

  late TextEditingController _stationNameController;
  late TextEditingController _latEditController;
  late TextEditingController _lonEditController;

  @override
  void initState(){
    super.initState();

    _stationNameController = TextEditingController();
    _latEditController = TextEditingController();
    _lonEditController = TextEditingController();

    _stationNameController.addListener(() => setState(() => {}));
    _latEditController.addListener(() => setState(() => {}));
    _lonEditController.addListener(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
     child: Container(
        width: 800,
        height: 1000,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column( // 定义垂直布局
              mainAxisAlignment: MainAxisAlignment.center, // 主轴居中布局，相关介绍可以搜下flutter-ui的内容
              children: <Widget>[
                Container(
                  child: Column( // 定义垂直布局
                    mainAxisAlignment: MainAxisAlignment.center, // 主轴居中布局，相关介绍可以搜下flutter-ui的内容
                    children: <Widget>[
                      Container(
                        child: Row(
                          // 站点名称
                          children: <Widget>[
                            _buildText("站点名称:"),
                            SizedBox(width: 10),
                            _buildCustomTextField("请输入站点名称", _stationNameController),
                          ]
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        child: Row(
                          // 触发关闭窗口
                          children: <Widget>[
                            _buildText("经      度: "),
                            SizedBox(width: 10),
                            _buildCustomTextField("请输入经度", _latEditController),
                          ]
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        child: Row(
                          // 触发关闭窗口
                          children: <Widget>[
                            _buildText("纬      度: "),
                            SizedBox(width: 10),
                            _buildCustomTextField("请输入纬度", _lonEditController),
                          ]
                        ),
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: Row(
                    // 触发关闭窗口
                    children: <Widget>[
                      _buildButton('保存',0),
                      SizedBox(width: 30),
                      _buildButton('取消',1)
                    ]
                  ) 
                )
              ]
          ),
        )
     )
    );
  }

  Text _buildText(String label){
    return Text(label,
            style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w100),
      );
  }

  Widget _buildCustomTextField(String label, TextEditingController controller) {
    return Container(
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 55,
              right: 10,
              top: 10,
              height: 30,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: label,
                  border: InputBorder.none,
                ),
                 style: TextStyle(fontSize: 26),
                obscureText: true,
              ),
            )
          ],
        ));
  }

  Widget _buildButton(String label, int type) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 10, right: 10),
      padding: EdgeInsets.all(0),
      //width: MediaQuery.of(context).size.width - 20,
      width: 300,
      height: 60,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightBlue.withOpacity(0.1),
        ),
        // ignore: deprecated_member_use
        child: FlatButton(
            onPressed: () {
              if(type == 0){
                Navigator.of(context, rootNavigator: true).pop();
              }
              if(type == 1){
                Navigator.of(context, rootNavigator: true).pop();
              }
            },
            child: Text(
              label,
              style: TextStyle(color: Colors.black, fontSize: 28),
            )),
      ),
    );
  }
}
