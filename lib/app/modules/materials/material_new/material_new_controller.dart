import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import 'repositories/material_new_repository.dart';

part 'material_new_controller.g.dart';

class MaterialNewController = _MaterialNewControllerBase
    with _$MaterialNewController;

abstract class _MaterialNewControllerBase with Store {

  _MaterialNewControllerBase(this.materialNewRepository);  

  final MaterialNewRepository materialNewRepository;

  String errorTitle;
  String errorMsg;

  @observable
  String code = "";
  
  @action
  changeCode(String value) => code = value;

  @observable
  String description = "";
  
  @action
  changeDescription(String value) => description = value;

  @action
  Future<bool> save() async {
    if(code != null && description != null) {
      return await materialNewRepository.repositorySave(code, description);
    }
    return false;
  }

  @computed
  bool get isFormValid {
    return validateCode() == null && validateDescription() == null;
  }
  
  String validateCode() {
    if (validatorRequired(code)) return "Obrigatorio.";
    return null;
  }

  String validateDescription() {
    if (validatorRequired(description)) return "Obrigatorio.";
    return null;
  }
}
