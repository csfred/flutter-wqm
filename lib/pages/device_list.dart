import 'package:flutter/material.dart';

class DeviceListPage extends StatefulWidget {
  @override
  _DeviceListPageState createState() => _DeviceListPageState();
}

class _DeviceListPageState extends State<DeviceListPage> {
  

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
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Row(
              children: <Widget>[
                Text("device list"),
                SizedBox(width: 10),
                _buildButton('退出', 1),
              ]
            ),
        
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

}