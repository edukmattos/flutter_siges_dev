import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'material_favorites_controller.dart';

class MaterialFavoritesPage extends StatefulWidget {
  final String title;
  const MaterialFavoritesPage({Key key, this.title = "MaterialFavorites"})
      : super(key: key);

  @override
  _MaterialFavoritesPageState createState() => _MaterialFavoritesPageState();
}

class _MaterialFavoritesPageState
    extends ModularState<MaterialFavoritesPage, MaterialFavoritesController> {
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
