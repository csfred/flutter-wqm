import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SideBar extends StatelessWidget {
  final double defaultFontSize = 22;
  final double defaultSecondFontSize = 18;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Image.asset(
          "images/main.jpg",
          fit: BoxFit.fill,
          height: 170.5,
        ),
        Divider(),
        SizedBox(height: 10),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.home),
          ),
          title: Text("首页", style: TextStyle(fontSize: defaultFontSize)),
          onTap: () => Navigator.pushNamed(context, "/Home"),
        ),
        Divider(),
        SizedBox(height: 10),
        ExpansionTile(title: Text("站点信息", style: TextStyle(fontSize: defaultFontSize)),
          leading: CircleAvatar(
            child: Icon(Icons.data_usage),
          ),
          children: [
            SizedBox(height: 30),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.room),
              ),
              title: Text("展示地图", style: TextStyle(fontSize: defaultSecondFontSize)),
              onTap: () => Navigator.pushNamed(context, '/StationMap'),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.edit),
              ),
              title: Text("编辑地图", style: TextStyle(fontSize: defaultSecondFontSize)),
              onTap: () => Navigator.pushNamed(context,  '/StationEdit')
            ),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.devices),
              ),
              title: Text("设备操作", style: TextStyle(fontSize: defaultSecondFontSize)),
              onTap: () => Navigator.pushNamed(context, "/DeviceOpt"),
            ),
            SizedBox(height: 30),
          ],
        ),
        Divider(),
        SizedBox(height: 10),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.assessment),
          ),
          title: Text("报表", style: TextStyle(fontSize: defaultFontSize)),
          onTap: () => Navigator.pushNamed(context, "/Report"),
        ),
        Divider(),
        SizedBox(height: 10),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.edit_attributes),
          ),
          title: Text("用户管理", style: TextStyle(fontSize: defaultFontSize)),
          onTap: () => Navigator.pushNamed(context, "/UserManage"),
        )
      ],
    );
  }
}
