import 'package:mobx/mobx.dart';

part 'material_show_controller.g.dart';

class MaterialShowController = _MaterialShowControllerBase
    with _$MaterialShowController;

abstract class _MaterialShowControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
