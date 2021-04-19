import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LogoApp(title: 'Flutter Demo Home Page'),
    );
  }
}


class LogoApp extends StatefulWidget {
  LogoApp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin  {

  Animation<double> animation;
  AnimationController controller;

  void initState(){
    super.initState();
    //构建一个动画控制器，时长为2秒
    controller=AnimationController(duration:const Duration(seconds: 2),
        vsync: this);
    //构建一个动画对象，补间300帧，设置控制器和监听
    animation=Tween<double>(begin: 0,end:300).animate(controller)
      ..addListener(() {
        setState(() {

        });
      });
    //打开控制器
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }



}