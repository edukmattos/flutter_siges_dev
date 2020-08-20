import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/widgets/drawer/drawer_navigation_widget.dart';
import '../../../config/app_config.dart';
import '../../../models/client_model.dart';
import 'client_list_controller.dart';

class ClientListPage extends StatefulWidget {
  final String title;
  final String subtitle;

  const ClientListPage(
      {Key key,
      this.title = appPageTagClient,
      this.subtitle = appPageTagFunctionSearch})
      : super(key: key);

  @override
  _ClientListPageState createState() => _ClientListPageState();
}

class _ClientListPageState
    extends ModularState<ClientListPage, ClientListController> {
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
            child: Text(
              widget.subtitle,
              style: TextStyle(fontSize: 12.0),
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
          Modular.to.pushReplacementNamed('/client/new');
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
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Observer(
          name: 'clientListObserver',
          builder: (BuildContext context) {
            if (controller.clients.hasError) {
              print(controller.clients.hasError);
              return Center(
                child: Text('Erro a realizar a pesquisa !'),
              );
            }

            if (controller.clients.value == null) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ));
            }

            List<ClientModel> list = controller.clients.value;

            return ListView.builder(
              reverse: false,
              itemCount: controller.clients.value.length,
              itemBuilder: (context, int index) {
                var model = list[index];

                print(model.name);

                return _getListTile(model);
              },
            );
          },
        ),
      ),
      drawer: DrawerNavigationWidget(),
    );
  }

  ListTile _getListTile(model) {
    print(model.einSsa);
    return ListTile(
      leading: _getLeadingWidget(),
      title: _getTitleWidget('${model.name}'),
      subtitle: _getSubtitleWidget('${model.einSsa}'),
      isThreeLine: false,
      trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 40.0),
      //selected: false,
      onLongPress: () {
        print("onLongPress");
      },
      onTap: () {
        print("onLongPress");
      },
    );
  }

  CircleAvatar _getLeadingWidget() {
    return CircleAvatar();
  }

  Text _getTitleWidget(String modelName) {
    return Text(
      modelName,
      style: new TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Text _getSubtitleWidget(String modelEinSSa) {
    return Text(
      modelEinSSa,
      style: new TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
