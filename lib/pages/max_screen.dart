// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MaxScreenPage extends StatefulWidget {
  @override
  _MaxScreenPageState createState() => _MaxScreenPageState();
}

class _MaxScreenPageState extends State<MaxScreenPage> {

   @override
   void initState(){
     super.initState();
     // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'local_map',
        (int viewId) => IFrameElement()
        ..style.border = 'none'
        ..src = 'assets/watch/map.html');
        //..src = 'https://www.baidu.com');
   }

  @override
  Widget build(BuildContext context) {
    
    return HtmlElementView(
         viewType: 'local_map',
      );
  }
}