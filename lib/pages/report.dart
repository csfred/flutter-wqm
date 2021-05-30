import 'package:flutter/material.dart';
import 'package:flutter_web/side_bar.dart';

import 'data_model/user.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  late final List<User> _data = [];
  
  @override
  void initState() {
    super.initState();
    List.generate(100, (index) {
      _data.add(User('老孟$index', index % 50, index % 2 == 0 ? '男' : '女', index / 2));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '污水处理在线监测平台 / 报表',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
         //width: 1500.0,
        // height: 100.0,
        child: paginatedDataTableWidget(context),
      ),
      drawer: Builder(
        builder: (context) => Drawer(
          child: SideBar(),
        ),
      ),
    );
  }

  Widget paginatedDataTableWidget(BuildContext context){
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Table(
         //设置表格有多少列,并制定列宽
            columnWidths: const <int, TableColumnWidth>{
              //指定索引及固定列宽
              0: FixedColumnWidth(100.0),
              1: FixedColumnWidth(40.0),
              2: FixedColumnWidth(80.0),
              3: FixedColumnWidth(80.0),
            },

            //设置表格边框样式
            border: TableBorder.all(
                color: Colors.black26, width: 2.0, style: BorderStyle.solid),
            children: const <TableRow>[
              TableRow(children: <Widget>[
                Text('姓名'),
                Text('性别'),
                Text('年龄'),
                Text('体重'),
              ]),
              TableRow(children: <Widget>[
                Text('小红'),
                Text('女'),
                Text('20'),
                Text('50'),
              ]),
              TableRow(children: <Widget>[
                Text('小强'),
                Text('男'),
                Text('20'),
                Text('50'),
              ]),
            ]
          ),
    );
  }
}
