import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import 'repositories/units_measure_new_repository.dart';

part 'units_measure_new_controller.g.dart';

class UnitsMeasureNewController = _UnitsMeasureNewControllerBase
    with _$UnitsMeasureNewController;

abstract class _UnitsMeasureNewControllerBase with Store {

  _UnitsMeasureNewControllerBase(this.unitsMeasureNewRepository);
  
  final UnitsMeasureNewRepository unitsMeasureNewRepository;

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
      //print(code);
      //print(description);
      errorTitle = "Ops ...";
      errorMsg = 'Senha incorreta !';
      
      return await unitsMeasureNewRepository.repositorySave(code, description);
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
