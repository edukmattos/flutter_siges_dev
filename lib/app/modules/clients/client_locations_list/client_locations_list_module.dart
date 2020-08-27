import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'client_locations_list_controller.dart';
import 'client_locations_list_page.dart';
import 'repositories/client_locations_list_repository.dart';
import 'repositories/interfaces/client_locations_list_repository_interface.dart';

class ClientLocationsListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IClientLocationsListRepository>(
            (i) => ClientLocationsListRepository(Dio())),
        Bind((i) => ClientLocationsListController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ClientLocationsListPage()),
      ];

  static Inject get to => Inject<ClientLocationsListModule>.of();
}
