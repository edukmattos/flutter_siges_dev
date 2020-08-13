import 'package:mobx/mobx.dart';

part 'material_dashboard_controller.g.dart';

class MaterialDashboardController = _MaterialDashboardControllerBase
    with _$MaterialDashboardController;

abstract class _MaterialDashboardControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
