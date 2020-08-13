import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'material_dashboard_controller.dart';
import 'material_dashboard_page.dart';
import 'repositories/interfaces/material_dashboard_repository_interface.dart';
import 'repositories/material_dashboard_repository.dart';

class MaterialDashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IMaterialDashboardRepository>(
            (i) => MaterialDashboardRepository(Dio())),
        Bind((i) => MaterialDashboardController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => MaterialDashboardPage()),
      ];

  static Inject get to => Inject<MaterialDashboardModule>.of();
}
