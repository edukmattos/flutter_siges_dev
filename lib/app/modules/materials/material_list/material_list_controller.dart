import 'package:mobx/mobx.dart';

part 'material_list_controller.g.dart';

class MaterialListController = _MaterialListControllerBase
    with _$MaterialListController;

abstract class _MaterialListControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
