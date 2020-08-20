import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'client_show_controller.dart';
import 'client_show_page.dart';
import 'repositories/client_show_repository.dart';
import 'repositories/interfaces/client_show_repository_interface.dart';

class ClientShowModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IClientShowRepository>((i) => ClientShowRepository(Dio())),
        Bind((i) => ClientShowController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ClientShowPage()),
      ];

  static Inject get to => Inject<ClientShowModule>.of();
}
