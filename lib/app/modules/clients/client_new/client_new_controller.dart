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
    }
    
    //if (einSsa.length == 14) {
    // // ignore: unrelated_type_equality_checks
    // if (validateEinSsaUnique(einSsa) == false) return "CPF Indisponível.";
    //} 
    
    if (einSsa.length > 14) {
      if (!CNPJValidator.isValid(einSsa)) return "CNPJ Inválido.";
      // ignore: unrelated_type_equality_checks
      //if (validateEinSsaUnique(einSsa) == true) return "CNPJ Indisponível.";
    }
    //print("QQQQQQQ");
    return null;
  }

  String validateName() {
    if (validatorRequired(name)) return "Obrigatorio.";
    //if (validateNameUnique(name) != null) return "Indisponível.";
    return null;
  }

  String validateEmail() {
    if (validatorRequired(email)) return "Obrigatorio.";
    if (validatorEmail(email)) return "Inválido.";
    //if (validateEmailUnique(email) != null) return "Indisponível.";
    return null;
  }

  //@action
  //Future<bool> validateEmailUnique(email) async {
    //return (await _clientNewRepository.repositoryClientEmailUnique(email));
  //}

  @action
  Future<bool> validateEinSsaUnique(String einSsa) async {
    try {
      var isUnique = await _clientNewRepository.repositoryClientEinSsaUnique(einSsa);
      print(isUnique);
      return isUnique;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //@action
  //Future<bool> validateNameUnique(name) async {
  //  return (await _clientNewRepository.repositoryClientNameUnique(name));
  //}

  @action
  Future<bool> save() async {
    return await _clientNewRepository.repositoryClientSave(einSsa, name, email);
  }
}
