import 'package:hasura_connect/hasura_connect.dart';
import 'package:siges/app/models/material_model.dart';

import '../../material_document.dart';
import 'interfaces/material_list_repository_interface.dart';

class MaterialListRepository implements IMaterialListRepository {
  
  final HasuraConnect _hasuraConnect;

  MaterialListRepository(this._hasuraConnect);

  @override
  Stream<List<MaterialModel>> getMaterialAll() {
    
    var query = docMaterialAll;

    var snapshot = _hasuraConnect.subscription(query);
    
    return snapshot.map((data) => MaterialModel.fromJsonList(data['data']['materials']));

  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
