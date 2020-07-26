import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Inicio"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {

    var appBar = AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Observer(builder: (_) {
            return Switch(
              value: controller.appController.isDark,
              onChanged: (bool value) {
                controller.appController.themeChange();
              },
            );
          }),
        ],
      );

    return Scaffold(
      appBar: appBar,
      body: Container(
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * .5,
                  color: Colors.yellow,
                ),
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * .5,
                  color: Colors.green,
                )
              ],
            );
          }
        ),
      )
    );
  }
}
