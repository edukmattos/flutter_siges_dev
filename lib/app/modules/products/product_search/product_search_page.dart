import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:siges/app/config/app_config.dart';
import 'package:siges/app/models/product_model.dart';
import 'product_search_controller.dart';

class ProductSearchPage extends StatefulWidget {
  final String title;
  const ProductSearchPage({Key key, this.title = "ProductSearch"})
      : super(key: key);

  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState
    extends ModularState<ProductSearchPage, ProductSearchController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Text(
              "Women",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Observer(
                  name: 'productListObserver',
                  builder: (BuildContext context) {
                    if (controller.products.hasError) {
                      print(controller.products.hasError.toString());
                      return Center(
                        child: Text('Erro a realizar a pesquisa !'),
                      );
                    }
                    if (controller.products.value == null) {
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.red,
                      ));
                    }

                    List<ProductModel> list = controller.products.value;

                    return GridView.builder(
                        itemCount: controller.products.value.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: kDefaultPaddin,
                          crossAxisSpacing: kDefaultPaddin,
                        ),
                        itemBuilder: (context, int index) {
                          var model = list[index];
                          //print(model.color);
                          return ItemCard(
                              product: model,
                              press: () {
                                Modular.to.pushNamed("/product/show/:id",
                                    arguments: ProductModel(id: model.id));
                              });
                        });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ProductModel product;
  final Function press;

  const ItemCard({Key key, this.product, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(product.color);
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.title}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.code,
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.right,
            ),
          ),
          Text(
            "${product.code}",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          )
        ],
      ),
    );
  }
}

class Categories extends StatefulWidget {
  Categories({Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Hang bag", "Jewellery", "Footwear", "Dresses"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => builderCategory(index),
        ),
      ),
    );
  }

  builderCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.blue : Colors.blue[200],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: kDefaultPaddin / 4),
                height: 2,
                width: 30,
                color:
                    selectedIndex == index ? Colors.black : Colors.transparent)
          ],
        ),
      ),
    );
  }
}
