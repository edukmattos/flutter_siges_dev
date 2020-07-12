import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'material_list_controller.dart';

class MaterialListPage extends StatefulWidget {
  final String title;
  const MaterialListPage({Key key, this.title = "MaterialList"})
      : super(key: key);

  @override
  _MaterialListPageState createState() => _MaterialListPageState();
}

class _MaterialListPageState
    extends ModularState<MaterialListPage, MaterialListController> {
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
