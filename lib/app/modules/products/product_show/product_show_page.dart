import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:siges/app/config/app_config.dart';
import 'package:siges/app/models/product_model.dart';
import 'product_show_controller.dart';

class ProductShowPage extends StatefulWidget {
  final String title;
  final String id;
  const ProductShowPage({
    Key key,
    this.title = "ProductShow",
    this.id,
  }) : super(key: key);

  ProductModel get product => null;

  @override
  _ProductShowPageState createState() => _ProductShowPageState();
}

class _ProductShowPageState
    extends ModularState<ProductShowPage, ProductShowController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          SizedBox(
            width: kDefaultPaddin / 2,
          )
        ],
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    height: 500,
                    decoration: BoxDecoration(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
