import 'package:flutter/material.dart';

class DeviceListPage extends StatefulWidget {
  @override
  _DeviceListPageState createState() => _DeviceListPageState();
}

class _DeviceListPageState extends State<DeviceListPage> {
  
  double numRowWidth = 100.0;  //单个表宽
  double numRowHeight = 48.0;  //表格高

  @override
  void initState(){
    super.initState();
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
        height: 600,
        margin: EdgeInsets.only(top: 10),
        child: Row( 
          children: <Widget> [
            Container(
            child: Table(children: _buildTableColumnOne()),
            width: numRowWidth, //固定第一列
          ),
          Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Table(children: _buildTableRow()),
                  width: numRowWidth * 6,
                )
              )
            ),
            SizedBox(height: 20),
            _buildButton('关闭', 1),
          ]
        )
      )
    );
  }

  Widget _buildButton(String label, int type) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: EdgeInsets.all(0),
      //width: MediaQuery.of(context).size.width - 20,
      width: 120,
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

  List<TableRow> _buildTableColumnOne() {
    List<TableRow> returnList = [];
    returnList.add(_buildSingleColumnOne(-1));
    for (int i = 0; i < 5; i++) {
      returnList.add(_buildSingleColumnOne(i));
    }
    return returnList;
  }

  //创建tableRows
  List<TableRow> _buildTableRow() {
    List<TableRow> returnList = [];
    returnList.add(_buildSingleRow(-1));
    for (int i = 0; i < 5; i++) {
      returnList.add(_buildSingleRow(i));
    }
    return returnList;
  }

  //创建第一列tableRow
  TableRow _buildSingleColumnOne(int index) {
    return TableRow(
        //第一行样式 添加背景色
        children: [
          //增加行高
          _buildSideBox(index == -1 ? '纸品种类' : "黄边纸", index == -1),
        ]);
  }

   //创建一行tableRow
  TableRow _buildSingleRow(int index) {
    return TableRow(
        //第一行样式 添加背景色
        children: [
          _buildSideBox(index == -1 ? '实重' : "2676.30", index == -1),
          _buildSideBox(index == -1 ? '金额' : "100.30", index == -1),
          _buildSideBox(index == -1 ? '扣重' : "100", index == -1),
          _buildSideBox(index == -1 ? '单价(元/kg)' : "11640", index == -1),
          _buildSideBox(index == -1 ? '磅重(kg)' : "45", index == -1),
        ]);
  }

  //创建单个表格
  Widget _buildSideBox(String title, isTitle) {
    return SizedBox(
        height: numRowHeight,
        width: numRowWidth,
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 0.33, color: Colors.black12)
                    )
                ),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: isTitle ? 14 : 12, color: Colors.grey[33]),
            )));
  }

}