import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../models/client_model.dart';

abstract class IClientListRepository implements Disposable {
  Stream<List<ClientModel>> getClientAll();
}
