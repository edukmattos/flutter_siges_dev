import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import 'repositories/client_new_repository.dart';

part 'client_new_controller.g.dart';

class ClientNewController = _ClientNewControllerBase with _$ClientNewController;

abstract class _ClientNewControllerBase with Store {
  
  final ClientNewRepository _clientNewRepository;

  String errorTitle;
  String errorMsg;

  _ClientNewControllerBase(this._clientNewRepository);
  
  @observable
  String einSsa = "";
  
  @action
  changeEinSsa(String value) => einSsa = value;

  @observable
  String name = "";
  
  @action
  changeName(String value) => name = value;

  @observable
  String email = "";
  
  @action
  changeEmail(String value) => email = value;


  @computed
  bool get isFormValid {
    return validateEinSsa() == null && validateName() == null && validateEmail() == null;
  }
  
  String validateEinSsa() {
    if (validatorRequired(einSsa)) return "Obrigatorio.";
    return null;
  }

  String validateName() {
    if (validatorRequired(name)) return "Obrigatorio.";
    return null;
  }

  String validateEmail() {
    if (validatorRequired(email)) return "Obrigatorio.";
    return null;
  }

  @action
  Future<bool> save() async {
    return await _clientNewRepository.repositorySave(einSsa, name, email);
  }

}
