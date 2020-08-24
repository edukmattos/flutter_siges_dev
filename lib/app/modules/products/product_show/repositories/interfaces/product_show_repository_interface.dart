import 'package:flutter_modular/flutter_modular.dart';
import 'package:siges/app/models/product_model.dart';

abstract class IProductShowRepository implements Disposable {
  Stream<List<ProductModel>> getProductById(String id);
}
