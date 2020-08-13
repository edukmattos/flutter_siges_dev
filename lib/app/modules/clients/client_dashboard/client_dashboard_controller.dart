import 'package:mobx/mobx.dart';

part 'client_dashboard_controller.g.dart';

class ClientDashboardController = _ClientDashboardControllerBase
    with _$ClientDashboardController;

abstract class _ClientDashboardControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
