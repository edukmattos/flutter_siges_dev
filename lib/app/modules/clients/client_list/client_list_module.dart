import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:siges/app/config/hasura_config.dart';

import 'client_list_controller.dart';
import 'client_list_page.dart';
import 'repositories/client_list_repository.dart';
import 'repositories/interfaces/client_list_repository_interface.dart';

class ClientListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IClientListRepository>((i) => ClientListRepository(i.get<HasuraConnect>())),
        Bind((i) => ClientListController(i.get<IClientListRepository>())),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ClientListPage()),
      ];

  static Inject get to => Inject<ClientListModule>.of();
}
