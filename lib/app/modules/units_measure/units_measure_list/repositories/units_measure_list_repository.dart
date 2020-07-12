import 'package:hasura_connect/hasura_connect.dart';
import 'package:siges/app/models/units_measure_model.dart';
import '../../units_measure_document.dart';
import 'interfaces/units_measure_list_repository_interface.dart';

class UnitsMeasureListRepository implements IUnitsMeasureListRepository {
  final HasuraConnect _hasuraConnect;

  UnitsMeasureListRepository(this._hasuraConnect);

  Stream<List<UnitsMeasureModel>> getUnitsMeasureAll() {
    
    var query = docUnitsMeasureAll;

    var snapshot = _hasuraConnect.subscription(query);
    
    return snapshot.map((data) => UnitsMeasureModel.fromJsonList(data['data']['units_measure']));

  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
