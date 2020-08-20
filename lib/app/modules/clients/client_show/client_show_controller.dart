import 'package:mobx/mobx.dart';

part 'client_show_controller.g.dart';

class ClientShowController = _ClientShowControllerBase
    with _$ClientShowController;

abstract class _ClientShowControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
