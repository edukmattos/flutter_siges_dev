import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../models/product_model.dart';

abstract class IProductSearchRepository implements Disposable {
  Stream<List<ProductModel>> getProductAll();
}
