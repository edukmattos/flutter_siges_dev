import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../config/app_config.dart';
import 'units_measure_list_controller.dart';

class UnitsMeasureListPage extends StatefulWidget {
  final String title;
  const UnitsMeasureListPage({Key key, this.title = appUnitsMeasureListPageTag})
      : super(key: key);

  @override
  _UnitsMeasureListPageState createState() => _UnitsMeasureListPageState();
}

class _UnitsMeasureListPageState
    extends ModularState<UnitsMeasureListPage, UnitsMeasureListController> {
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
              hintText: "Pesquisar Unidades",
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
        name: 'unitsMeasureListObserver',
        builder: (BuildContext context) {

          if (controller.unitsMeasure.hasError) {
            print(controller.unitsMeasure.hasError);
            return Center(
              child: Text(
                'Erro a realizar a pesquisa !'
              ),
            );
          }

          if (controller.unitsMeasure.value == null) {
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

          return ListView.builder(
            itemCount: controller.unitsMeasure.value.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text(controller.unitsMeasure.value[index].code),
                subtitle: Text(controller.unitsMeasure.value[index].description),
                isThreeLine: true,
                trailing: Icon(Icons.account_circle),
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
