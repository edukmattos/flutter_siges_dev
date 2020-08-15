import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
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
    if (einSsa.length <= 14) {
      if (!CPFValidator.isValid(einSsa)) return "CPF Inválido.";
      if (validateEinSsaUnique(einSsa) != null) return "CPF Indisponível.";
    } else {
      if (!CNPJValidator.isValid(einSsa)) return "CNPJ Inválido.";
      if (validateEinSsaUnique(einSsa) != null) return "CNPJ Indisponível.";
    }
    return null;
  }

  String validateName() {
    if (validatorRequired(name)) return "Obrigatorio.";
    return null;
  }

  String validateEmail() {
    if (validatorRequired(email)) return "Obrigatorio.";
    if (validatorEmail(email)) return "Inválido.";
    if (validateEmailUnique(email) != null) return "Indisponível.";
    return null;
  }

  @action
  Future<bool> validateEmailUnique(email) async {
    return (await _clientNewRepository.repositoryClientEmailUnique(email));
  }

  @action
  Future<bool> validateEinSsaUnique(email) async {
    return (await _clientNewRepository.repositoryClientEinSsaUnique(einSsa));
  }

  @action
  Future<bool> save() async {
    return await _clientNewRepository.repositoryClientSave(einSsa, name, email);
  }


}
