import 'package:hasura_connect/hasura_connect.dart';
import 'package:siges/app/models/client_model.dart';

import '../../client_document.dart';
import 'interfaces/client_new_repository_interface.dart';

class ClientNewRepository implements IClientNewRepository {
  final HasuraConnect _hasuraConnect;

  ClientNewRepository(this._hasuraConnect);

  @override
  Future<bool> repositoryClientSave(String einSsa, String name, String email) async {
    
    var query = docClientSave;

    var snapshot = await _hasuraConnect.mutation(query, variables: {
      "ein_ssa": einSsa,
      "name": name,
      "email": email,
    });
    
    return snapshot["data"]["insert_clients"]["affected_rows"] > 0;
  }

  @override
  Future<bool> repositoryClientEmailUnique(String email) async {
    
    var query = docClientEinSsaUnique;

    var snapshot = _hasuraConnect.subscription(query);

    var clients = snapshot.map((data) => ClientModel.fromJsonList(data['data']['clients']));
    
    if (clients != null) {
      return false;
    } 
    return true;
  }

  @override
  Future<bool> repositoryClientEinSsaUnique(String einSsa) async {
    
    var query = docClientEinSsaUnique;

    var snapshot = _hasuraConnect.subscription(query);

    var clients = snapshot.map((data) => ClientModel.fromJsonList(data['data']['clients']));
    
    if (clients != null) {
      return false;
    } 
    return true;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
