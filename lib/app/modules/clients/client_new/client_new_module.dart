import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../config/hasura_config.dart';
import 'client_new_controller.dart';
import 'client_new_page.dart';
import 'repositories/client_new_repository.dart';
import 'repositories/interfaces/client_new_repository_interface.dart';

class ClientNewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IClientNewRepository>((i) => ClientNewRepository(i.get<HasuraConnect>())),
        Bind((i) => ClientNewController(i.get<IClientNewRepository>())),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ClientNewPage()),
      ];

  static Inject get to => Inject<ClientNewModule>.of();
}
