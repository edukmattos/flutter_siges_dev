import 'package:hasura_connect/hasura_connect.dart';
import 'package:siges/app/modules/units_measure/units_measure_document.dart';
import 'interfaces/material_new_repository_interface.dart';

class MaterialNewRepository implements IMaterialNewRepository {
  final HasuraConnect _hasuraConnect;

  MaterialNewRepository(this._hasuraConnect);

  Future<bool> repositorySave(String code, String description) async {

    print(code);
    print(description);
    
    var query = docUnitsMeasureSave;

    var snapshot = await _hasuraConnect.mutation(query, variables: {
      "code": code,
      "description": description,
    });
    
    return snapshot["data"]["insert_units_measure"]["affected_rows"] > 0;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}