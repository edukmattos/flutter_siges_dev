import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'client_dashboard_controller.dart';

class ClientDashboardPage extends StatefulWidget {
  final String title;
  const ClientDashboardPage({Key key, this.title = "ClientDashboard"})
      : super(key: key);

  @override
  _ClientDashboardPageState createState() => _ClientDashboardPageState();
}

class _ClientDashboardPageState
    extends ModularState<ClientDashboardPage, ClientDashboardController> {
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
