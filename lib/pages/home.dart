// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   @override
   void initState(){
     super.initState();
     // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'local_map',
        (int viewId) => IFrameElement()
        ..style.border = 'none'
        ..allowFullscreen = true
        ..src = 'assets/watch/map.html');
        //..src = 'https://www.baidu.com');
   }

  @override
  Widget build(BuildContext context) {
    HtmlElementView htmlElementView = HtmlElementView(
         viewType: 'local_map',
      );
      return htmlElementView;
  }
}