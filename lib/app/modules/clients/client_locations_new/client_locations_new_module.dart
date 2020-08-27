import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'client_locations_new_controller.dart';
import 'client_locations_new_page.dart';
import 'repositories/client_locations_new_repository.dart';
import 'repositories/interfaces/client_locations_new_repository_interface.dart';

class ClientLocationsNewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IClientLocationsNewRepository>(
            (i) => ClientLocationsNewRepository(Dio())),
        Bind((i) => ClientLocationsNewController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ClientLocationsNewPage()),
      ];

  static Inject get to => Inject<ClientLocationsNewModule>.of();
}
