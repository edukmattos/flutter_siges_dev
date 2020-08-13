import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../config/app_config.dart';
import 'material_dashboard_controller.dart';

class MaterialDashboardPage extends StatefulWidget {
  final String title;
  final String subtitle;

  const MaterialDashboardPage({
    Key key, 
    this.title = appPageTagMaterial, 
    this.subtitle = appPageTagFunctionDashboard
  })
  : super(key: key);

  @override
  _MaterialDashboardPageState createState() => _MaterialDashboardPageState();
}

class _MaterialDashboardPageState
    extends ModularState<MaterialDashboardPage, MaterialDashboardController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {

    var appBar = AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.title),
          Visibility(
            visible: true,
            child: Text(widget.subtitle,
              style: TextStyle(
                fontSize: 12.0
              ),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), 
        onPressed: () {
          Modular.to.pushReplacementNamed('/material/new');
        },
      ),     
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ]
        )
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
