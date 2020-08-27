import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import 'repositories/client_locations_new_repository.dart';

part 'client_locations_new_controller.g.dart';

class ClientLocationsNewController = _ClientLocationsNewControllerBase
    with _$ClientLocationsNewController;

abstract class _ClientLocationsNewControllerBase with Store {
  //final ClientLocationsNewRepository _clientLocationsNewRepository;

  String errorTitle;
  String errorMsg;

  @observable
  String description = "";

  @action
  changeDescription(String value) => description = value;

  @computed
  bool get isFormValid {
    return validateDescription() == null;
  }

  String validateDescription() {
    if (validatorRequired(description)) return "Obrigatorio.";
    return null;
  }

  @action
  void save() {}
}
