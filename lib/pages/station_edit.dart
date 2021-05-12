import 'package:flutter/material.dart';

class StationEditPage extends StatefulWidget {
  @override
  _StationEditPageState createState() => _StationEditPageState();
}

class _StationEditPageState extends State<StationEditPage> {
  double progress = 0;
  String url = "";

  late TextEditingController _stationNameEditController;
  late TextEditingController _stationIdEditController;
  late TextEditingController _scaleEditController;
  late TextEditingController _staffEditController;
  late TextEditingController _addressEditController;
  late TextEditingController _latEditController;
  late TextEditingController _lonEditController;

  @override
  void initState(){
    super.initState();

    _stationNameEditController = TextEditingController();
    _stationIdEditController = TextEditingController();
    _scaleEditController = TextEditingController();
    _staffEditController = TextEditingController();
    _addressEditController = TextEditingController();
    _latEditController = TextEditingController();
    _lonEditController = TextEditingController();

    _stationNameEditController.addListener(() => setState(() => {}));
    _stationIdEditController.addListener(() => setState(() => {}));
    _scaleEditController.addListener(() => setState(() => {}));
    _staffEditController.addListener(() => setState(() => {}));
    _addressEditController.addListener(() => setState(() => {}));
    _latEditController.addListener(() => setState(() => {}));
    _lonEditController.addListener(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
        ),
      backgroundColor: Colors.amber[50],
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
                      // 站点名称
                      _buildDialogItem("站点名称:","请输入站点名称", _stationNameEditController),
                      SizedBox(height: 30),
                      _buildDialogItem("站点编号:","请输入站点编号", _stationIdEditController),
                      SizedBox(height: 30),
                      _buildDialogItem("规    模:","请输入规模", _scaleEditController),
                      SizedBox(height: 30),
                      _buildDialogItem("人    员:","请输入人员", _staffEditController),
                      SizedBox(height: 30),
                      _buildDialogItem("地    址:","请输入地址", _addressEditController),
                      SizedBox(height: 30),
                      _buildDialogItem("经    度:","请输入经度", _latEditController),
                      SizedBox(height: 30),
                      _buildDialogItem("纬    度:","请输入纬度", _lonEditController),
                    ]
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: Row(
                    // 触发关闭窗口
                    children: <Widget>[
                      _buildButton('保 存',0),
                      SizedBox(width: 10),
                      _buildButton('取 消',1),
                      SizedBox(width: 10),
                      _buildButton('添加底图',1)
                    ]
                  ) 
                )
              ]
          ),
        )
     )
    );
  }

  Container _buildDialogItem(String label, String title, TextEditingController controller){
    return Container(
            child: Row(
              children: <Widget>[
                _buildText(label),
                SizedBox(width: 10),
                _buildCustomTextField(title, controller),
              ]
            ),
          );
  }

  Container _buildText(String label){
    return Container(
      width: 150,
        child:Text(label,
              style: TextStyle(
              fontSize: 25,
              letterSpacing:5,
              color: Colors.black,
              fontWeight: FontWeight.w100),
        )
      );
  }

  Widget _buildCustomTextField(String label, TextEditingController controller) {
    return Container(
        width: 400,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 55,
              right: 10,
              top: 10,
              height: 55,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: label,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                ),
                 style: TextStyle(fontSize: 26),
                 //文本是否隐藏
                obscureText: false,
              ),
            )
          ],
        ));
  }

  Widget _buildButton(String label, int type) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: EdgeInsets.all(0),
      //width: MediaQuery.of(context).size.width - 20,
      width: 180,
      height: 60,
      child: Container(
        height: 45,
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
              if(type == 2){
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
