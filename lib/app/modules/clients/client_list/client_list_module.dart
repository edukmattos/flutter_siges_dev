import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'client_list_controller.dart';
import 'client_list_page.dart';
import 'repositories/client_list_repository.dart';
import 'repositories/interfaces/client_list_repository_interface.dart';

class ClientListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IClientListRepository>((i) => ClientListRepository(Dio())),
        Bind((i) => ClientListController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ClientListPage()),
      ];

  static Inject get to => Inject<ClientListModule>.of();
}
