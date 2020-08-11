import 'package:flutter_modular/flutter_modular.dart';
import 'package:siges/app/models/units_measure_model.dart';

abstract class IMaterialNewRepository implements Disposable {

  Future<List<UnitsMeasureModel>> getUnitsMeasureAll();

  Future<bool> repositorySave(String code, String description, UnitsMeasureModel unitMeasureSelected);
  
}
