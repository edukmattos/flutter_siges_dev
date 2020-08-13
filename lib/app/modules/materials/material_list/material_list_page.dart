import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:siges/app/config/app_config.dart';
import 'package:siges/app/models/material_model.dart';
import 'package:siges/shared/widgets/drawer/drawer_navigation_widget.dart';
import 'material_list_controller.dart';

class MaterialListPage extends StatefulWidget {
  final String title;
  final String subtitle;

  const MaterialListPage({
    Key key, 
    this.title = appPageTagMaterial, 
    this.subtitle = appPageTagFunctionSearch
  })
  : super(key: key);

  @override
  _MaterialListPageState createState() => _MaterialListPageState();
}

class _MaterialListPageState
    extends ModularState<MaterialListPage, MaterialListController> {
  //use 'controller' variable to access controller

  bool isSearching = false;

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

    //var appBar = AppBar(
    //  title: !isSearching 
    //    ? Text(widget.title)
    //    : TextField(
    //      style: TextStyle(
    //        color: Colors.white
    //      ),
    //      decoration: InputDecoration(
    //        icon: Icon(
    //          Icons.search,
    //          color: Colors.white
    //        ),
    //        hintText: "Pesquisar Materiais",
    //        hintStyle: TextStyle(
    //          color: Colors.white
    //        )
    //      )
    //    ),
    //  leading: IconButton(
    //    icon: Icon(Icons.menu), 
    //    onPressed: null
    //  ),
    //  actions: <Widget>[
    //    isSearching 
    //    ? IconButton(
    //      icon: Icon(Icons.cancel),
    //      onPressed: () {
    //        setState(() {
    //          isSearching = !this.isSearching;
    //        });
    //      }
    //    )
    //    : IconButton(
    //      icon: Icon(Icons.search),
    //      onPressed: () {
    //        setState(() {
    //          isSearching = !this.isSearching;
    //        });
    //      }
    //    ),
    //    IconButton(
    //      icon: Icon(Icons.more_vert),
    //      onPressed: () {
    //      },
    //    ),
    //  ]
    //);

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
      body: Observer(
        name: 'materialListObserver',
        builder: (BuildContext context) {

          if (controller.materials.hasError) {
            print(controller.materials.hasError);
            return Center(
              child: Text(
                'Erro a realizar a pesquisa !'
              ),
            );
          }

          if (controller.materials.value == null) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              )
            );
          }

          List<MaterialModel> list = controller.materials.value;

          return ListView.builder(
            reverse: false,
            itemCount: controller.materials.value.length,
            itemBuilder: (_, int index) {
              
              var model = list[index];

              return ListTile(
                leading: Text('${model.code}'),
                title: Text('${model.description}'),
                subtitle: Text('${model.materialUnit.code}'),
                isThreeLine: false,
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 40.0),
                //selected: false,
                onLongPress: (){
                  print("onLongPress");
                },
                onTap: (){
                  print("onLongPress");
                },
              );
            }
          );
        }
      ),
      drawer: DrawerNavigationWidget(),
    );
  }
}
