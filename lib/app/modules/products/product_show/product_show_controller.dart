import 'package:mobx/mobx.dart';
import 'package:siges/app/models/product_model.dart';

import 'repositories/product_show_repository.dart';

part 'product_show_controller.g.dart';

class ProductShowController = _ProductShowControllerBase
    with _$ProductShowController;

abstract class _ProductShowControllerBase with Store {
  final ProductShowRepository _productShowRepository;
  final String id;

  @observable
  ObservableStream<List<ProductModel>> product;

  _ProductShowControllerBase(this._productShowRepository, this.id) {
    productById();
  }

  @action
  productById() {
    product = ObservableStream(_productShowRepository.getProductById(id));
  }
}
