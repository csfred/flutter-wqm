import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
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
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.home),
          ),
          title: Text("首页"),
          onTap: () => Navigator.pushNamed(context, "/Home"),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.room),
          ),
          title: Text("站点地图"),
          onTap: () => Navigator.pushNamed(context, '/StationMap'),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.edit),
          ),
          title: Text("站点编辑"),
          onTap: () => Navigator.pushNamed(context, '/StationEdit'),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.devices),
          ),
          title: Text("设备操作"),
          onTap: () => Navigator.pushNamed(context, "/DeviceOpt"),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.assessment),
          ),
          title: Text("报表"),
          onTap: () => Navigator.pushNamed(context, "/Report"),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.edit_attributes),
          ),
          title: Text("用户管理"),
          onTap: () => Navigator.pushNamed(context, "/UserManage"),
        )
      ],
    );
  }
}
