import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:siges/app/models/material_model.dart';
import 'material_list_controller.dart';

class MaterialListPage extends StatefulWidget {
  final String title;
  const MaterialListPage({Key key, this.title = "Materiais"})
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
    return Scaffold(
      appBar: AppBar(
        title: !isSearching 
          ? Text(widget.title)
          : TextField(
            style: TextStyle(
              color: Colors.white
            ),
            decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.white
              ),
              hintText: "Pesquisar Materiais",
              hintStyle: TextStyle(
                color: Colors.white
              )
            )
          ),
        leading: IconButton(
          icon: Icon(Icons.menu), 
          onPressed: null
        ),
        actions: <Widget>[
          isSearching 
          ? IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                isSearching = !this.isSearching;
              });
           
            }
          )
          : IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                isSearching = !this.isSearching;
              });
           
            }
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
           
            },
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), 
        onPressed: () {
          Modular.to.pushReplacementNamed('/units_measure/new');
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

          // Ordenacao
          //controller.unitsMeasure.value.sort(
          //  (unitMeasure1, unitMeasure2) => unitMeasure1.description.toUpperCase().compareTo(unitMeasure2.description.toUpperCase())
          //);

          List<MaterialModel> list = controller.materials.value;

          return ListView.builder(
            itemCount: controller.materials.value.length,
            itemBuilder: (_, int index) {
              
              var model = list[index];

              return ListTile(
                leading: Text('${model.code}'),
                title: Text('${model.description}'),
                subtitle: Text(''),
                isThreeLine: false,
                trailing: Text('${model.materialUnit.code}'),
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
    );
  }
}
