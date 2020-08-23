import 'package:mobx/mobx.dart';

part 'product_show_controller.g.dart';

class ProductShowController = _ProductShowControllerBase
    with _$ProductShowController;

abstract class _ProductShowControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
