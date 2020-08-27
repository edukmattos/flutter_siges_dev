import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'material_show_controller.dart';

class MaterialShowPage extends StatefulWidget {
  final String title;
  const MaterialShowPage({Key key, this.title = "MaterialShow"})
      : super(key: key);

  @override
  _MaterialShowPageState createState() => _MaterialShowPageState();
}

class _MaterialShowPageState
    extends ModularState<MaterialShowPage, MaterialShowController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
