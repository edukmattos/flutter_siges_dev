import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'client_dashboard_controller.dart';
import 'client_dashboard_page.dart';
import 'repositories/client_dashboard_repository.dart';
import 'repositories/interfaces/client_dashboard_repository_interface.dart';

class ClientDashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IClientDashboardRepository>(
            (i) => ClientDashboardRepository(Dio())),
        Bind((i) => ClientDashboardController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ClientDashboardPage()),
      ];

  static Inject get to => Inject<ClientDashboardModule>.of();
}
