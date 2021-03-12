import 'package:flutter/material.dart';

import 'side_bar.dart';
import 'route.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉Debug图标
      theme: ThemeData(primarySwatch: Colors.indigo),
      onGenerateRoute: onGenerateRoute,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '污水处理在线监测平台',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Container(
            child: Column(children: <Widget>[
          Container(
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container()),
          Expanded(
            child: Container(
                // child: InAppWebView(
                //   initialUrl:
                //       "https://voice.baidu.com/act/newpneumonia/newpneumonia/?from=osari_pc_3#tab0",
                //   initialHeaders: {},
                //   initialOptions: InAppWebViewWidgetOptions(
                //       inAppWebViewOptions: InAppWebViewOptions(
                //     debuggingEnabled: true,
                //   )),
                //   onWebViewCreated: (InAppWebViewController controller) {
                //     webView = controller;
                //   },
                //   onLoadStart: (InAppWebViewController controller, String url) {
                //     setState(() {
                //       this.url = url;
                //     });
                //   },
                //   onLoadStop:
                //       (InAppWebViewController controller, String url) async {
                //     setState(() {
                //       this.url = url;
                //     });
                //   },
                //   onProgressChanged:
                //       (InAppWebViewController controller, int progress) {
                //     setState(() {
                //       this.progress = progress / 100;
                //     });
                //   },
                // ),
                ),
          ),
        ])),
        drawer: Builder(
          builder: (context) => Drawer(
            child: SideBar(),
          ),
        ),
      ),
    );
  }
}
