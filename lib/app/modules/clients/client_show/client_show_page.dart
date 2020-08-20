import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'client_show_controller.dart';

class ClientShowPage extends StatefulWidget {
  final String title;
  const ClientShowPage({Key key, this.title = "ClientShow"}) : super(key: key);

  @override
  _ClientShowPageState createState() => _ClientShowPageState();
}

class _ClientShowPageState
    extends ModularState<ClientShowPage, ClientShowController> {
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
