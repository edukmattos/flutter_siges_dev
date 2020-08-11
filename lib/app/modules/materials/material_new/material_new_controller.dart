import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import '../../../models/units_measure_model.dart';
import 'repositories/material_new_repository.dart';

part 'material_new_controller.g.dart';

class MaterialNewController = _MaterialNewControllerBase
    with _$MaterialNewController;

abstract class _MaterialNewControllerBase with Store {

  final MaterialNewRepository _materialNewRepository;

  String errorTitle;
  String errorMsg;

  _MaterialNewControllerBase(this._materialNewRepository){
    unitsMeasureAll();
  } 

  @observable
  String code = "";
  
  @action
  changeCode(String value) => code = value;

  @observable
  String description = "";
  
  @action
  changeDescription(String value) => description = value;

  @observable
  List<UnitsMeasureModel> unitsMeasureOptions;

  @action
  unitsMeasureAll() async {
    this.unitsMeasureOptions = await _materialNewRepository.getUnitsMeasureAll();
    //print(this.unitsMeasureOptions);
  }

  @observable
  UnitsMeasureModel unitMeasureSelected;
  
  @action
  changeUnitMeasureSelected(UnitsMeasureModel unitMeasureSelected) => this.unitMeasureSelected = unitMeasureSelected;

  @action
  Future<bool> save() async {
    if(code != null && description != null) {
      return await _materialNewRepository.repositorySave(code, description, unitMeasureSelected);
    }
    return false;
  }

  @computed
  bool get isFormValid {
    return validateCode() == null && validateDescription() == null && validateMaterialUnitId() == null;
  }
  
  String validateCode() {
    if (validatorRequired(code)) return "Obrigatorio.";
    return null;
  }

  String validateDescription() {
    if (validatorRequired(description)) return "Obrigatorio.";
    return null;
  }

  String validateMaterialUnitId() {
    if (validatorRequired(unitMeasureSelected)) return "Obrigatorio.";
    return null;
  }
}
