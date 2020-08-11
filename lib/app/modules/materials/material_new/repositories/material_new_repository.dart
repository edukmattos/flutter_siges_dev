import 'package:hasura_connect/hasura_connect.dart';
import 'package:siges/app/models/units_measure_model.dart';
import 'package:siges/app/modules/units_measure/units_measure_document.dart';
import 'interfaces/material_new_repository_interface.dart';

class MaterialNewRepository implements IMaterialNewRepository {
  final HasuraConnect _hasuraConnect;

  MaterialNewRepository(this._hasuraConnect);

  @override
  Future<List<UnitsMeasureModel>> getUnitsMeasureAll() async {
    
    var query = docUnitsMeasureAll;

    var snapshot = await _hasuraConnect.query(query);

    return UnitsMeasureModel.fromJsonList(snapshot['data']['units_measure']);
  }
  
  @override
  Future<bool> repositorySave(String code, String description, UnitsMeasureModel unitMeasureSelected) async {

    print(code);
    print(description);
    
    var query = docUnitsMeasureSave;

    var snapshot = await _hasuraConnect.mutation(query, variables: {
      "code": code,
      "description": description,
      "material_unit_id": unitMeasureSelected.id,
    });
    
    return snapshot["data"]["materials"]["affected_rows"] > 0;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}