import 'package:mobx/mobx.dart';

part 'client_list_controller.g.dart';

class ClientListController = _ClientListControllerBase
    with _$ClientListController;

abstract class _ClientListControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
