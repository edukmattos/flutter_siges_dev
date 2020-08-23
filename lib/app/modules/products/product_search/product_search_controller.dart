import 'package:mobx/mobx.dart';
import 'package:siges/app/models/product_model.dart';
import 'package:siges/app/modules/products/product_search/repositories/product_search_repository.dart';

part 'product_search_controller.g.dart';

class ProductSearchController = _ProductSearchControllerBase
    with _$ProductSearchController;

abstract class _ProductSearchControllerBase with Store {
  final ProductSearchRepository _productSearchRepository;

  @observable
  ObservableStream<List<ProductModel>> products;

  _ProductSearchControllerBase(this._productSearchRepository) {
    productsAll();
  }

  @action
  productsAll() {
    products = ObservableStream(_productSearchRepository.getProductAll());
  }
}
