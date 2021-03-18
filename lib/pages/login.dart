import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _pwdEditController;
  TextEditingController _userNameEditController;

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _pwdEditController = TextEditingController();
    _userNameEditController = TextEditingController();

    _pwdEditController.addListener(() => setState(() => {}));
    _userNameEditController.addListener(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTopWidget(context),
            //_buildAccountLoginTip(),
            SizedBox(height: 100),
            _buildEditWidget(context),
            SizedBox(height: 50),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  /// 头部
  Widget _buildTopWidget(BuildContext context) {
    double height = 200.0;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      color: Colors.blue[400],
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            left: (width - 90) / 2.0,
            top: height - 45,
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                ///阴影
                boxShadow: [
                  BoxShadow(color: Theme.of(context).cardColor, blurRadius: 4.0)
                ],

                ///形状
                shape: BoxShape.circle,

                ///图片
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // image: NetworkImage(
                  //     'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fandroid-artworks.25pp.com%2Ffs08%2F2017%2F03%2F07%2F7%2F115_138fdfc2130162fac11d293a89856799_con_130x130.png&refer=http%3A%2F%2Fandroid-artworks.25pp.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1618475193&t=aba0fd4c9e06e01555f3ee44a88a16d5'
                  //     ),
                  image: NetworkImage('images/main.jpg'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEditWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: <Widget>[
          _buildLoginNameTextField(),
          SizedBox(height: 50.0),
          _buildPwdTextField(),
        ],
      ),
    );
  }

  Widget _buildLoginNameTextField() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Stack(
        children: <Widget>[
          // Positioned(
          //   left: 16,
          //   top: 11,
          //   width: 18,
          //   height: 18,
          //   child: Image.asset('images/login_user.jpg'),
          // ),
          Positioned(
            left: 45,
            top: 10,
            bottom: 10,
            width: 1,
            child: Container(
              color: Colors.black,
            ),
          ),
          Positioned(
            left: 55,
            right: 10,
            top: 10,
            height: 30,
            child: TextField(
              controller: _userNameEditController,
              focusNode: _userNameFocusNode,
              decoration: InputDecoration(
                hintText: "请输入用户名",
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPwdTextField() {
    return Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Stack(
          children: <Widget>[
            // Positioned(
            //   left: 16,
            //   top: 11,
            //   width: 18,
            //   height: 18,
            //   child: Image.asset('images/login_pwd.jpg'),
            // ),
            Positioned(
              left: 45,
              top: 10,
              bottom: 10,
              width: 1,
              child: Container(
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 55,
              right: 10,
              top: 10,
              height: 30,
              child: TextField(
                controller: _pwdEditController,
                focusNode: _pwdFocusNode,
                decoration: InputDecoration(
                  hintText: "请输入密码",
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 14),
                obscureText: true,

                /// 设置密码
              ),
            )
          ],
        ));
  }

  Widget _buildLoginButton() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 10, right: 10),
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width - 20,
      height: 40,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightBlue.withOpacity(0.1),
        ),
        // ignore: deprecated_member_use
        child: FlatButton(
            onPressed: () {
              if (_checkInput()) {
                // Fluttertoast.showToast(
                //     msg: "登录成功",
                //     gravity: ToastGravity.CENTER,
                //     timeInSecForIos: 2,
                //     textColor: Colors.white,
                //     fontSize: 14.0);
                if (_userNameEditController.text == "admin" &&
                    _pwdEditController.text == "123456") {
                  _userNameEditController.clear();
                  _pwdEditController.clear();
                  _userNameFocusNode.unfocus();
                  _pwdFocusNode.unfocus();
                  setState(() {});
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(
                          builder: (context) => new HomePage()),
                      (route) => route == null);
                }
              }
            },
            child: Text(
              "登录",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }

  bool _checkInput() {
    if (_userNameEditController.text.length == 0) {
      Fluttertoast.showToast(
          msg: "请输入用户名",
          gravity: ToastGravity.CENTER,
          //timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 14.0);
      return false;
    } else if (_pwdEditController.text.length == 0) {
      Fluttertoast.showToast(
          msg: "请输入密码",
          gravity: ToastGravity.CENTER,
          //timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 14.0);
      return false;
    }
    return true;
  }
}
