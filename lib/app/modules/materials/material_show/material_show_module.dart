import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'material_show_controller.dart';
import 'material_show_page.dart';
import 'repositories/interfaces/material_show_repository_interface.dart';
import 'repositories/material_show_repository.dart';

class MaterialShowModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IMaterialShowRepository>((i) => MaterialShowRepository(Dio())),
        Bind((i) => MaterialShowController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MaterialShowPage()),
      ];

  static Inject get to => Inject<MaterialShowModule>.of();
}
