import 'package:mobx/mobx.dart';

part 'client_locations_list_controller.g.dart';

class ClientLocationsListController = _ClientLocationsListControllerBase
    with _$ClientLocationsListController;

abstract class _ClientLocationsListControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
