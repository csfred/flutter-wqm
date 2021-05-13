# flutter_web

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

百度地图插件引入
http://lbsyun.baidu.com/index.php?title=flutter/loc/download  插件下载，直接下载  地图flutter插件 定位插件在web端无法使用
http://lbsyun.baidu.com/index.php?title=flutter/loc/guide/create  开发文档指导 

https://console.amap.com/dev/key/app 高德地图开发平台

flutter run -d chrome --release --web-renderer html --no-sound-null-safety 
不指定浏览器,作为服务端启动, 指定端口8091
flutter run --release --web-renderer html --no-sound-null-safety -d web-server   --web-hostname=127.0.0.1 --web-port 8091

git 设置代理
git config --global http.proxy 'http://proxyIpAddr:port'
git config --global https.proxy 'socks://proxyIpAddr:port'

git 取消代理
git config --global --unset http.proxy
git config --global --unset https.proxy

高德地图开发指南
https://developer.amap.com/api/javascript-api/guide/abc/plugins

FL Chart  比较好的图形库
地址：https://github.com/imaNNeoFighT/fl_chart

flutter比较火的开源项目
https://www.cnblogs.com/xichji/p/13343180.html

