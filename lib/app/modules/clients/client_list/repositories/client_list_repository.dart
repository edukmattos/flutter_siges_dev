import 'package:hasura_connect/hasura_connect.dart';

import '../../../../models/client_model.dart';
import '../../client_document.dart';
import 'interfaces/client_list_repository_interface.dart';

class ClientListRepository implements IClientListRepository {
  final HasuraConnect _hasuraConnect;

  ClientListRepository(this._hasuraConnect);

  @override
  Stream<List<ClientModel>> getClientAll() {
    
    var query = docClientAll;

    var snapshot = _hasuraConnect.subscription(query);
    
    return snapshot.map((data) => ClientModel.fromJsonList(data['data']['clients']));

  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
