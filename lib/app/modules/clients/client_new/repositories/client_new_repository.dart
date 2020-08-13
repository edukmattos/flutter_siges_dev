import 'package:hasura_connect/hasura_connect.dart';

import '../../client_document.dart';
import 'interfaces/client_new_repository_interface.dart';

class ClientNewRepository implements IClientNewRepository {
  final HasuraConnect _hasuraConnect;

  ClientNewRepository(this._hasuraConnect);

  @override
  Future<bool> repositorySave(String einSsa, String name, String email) async {
    
    var query = docClientSave;

    var snapshot = await _hasuraConnect.mutation(query, variables: {
      "ein_ssa": einSsa,
      "name": name,
      "email": email,
    });
    
    return snapshot["data"]["insert_clients"]["affected_rows"] > 0;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
