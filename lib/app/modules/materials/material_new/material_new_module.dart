import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../config/hasura_config.dart';
import 'material_new_controller.dart';
import 'material_new_page.dart';
import 'repositories/interfaces/material_new_repository_interface.dart';
import 'repositories/material_new_repository.dart';

class MaterialNewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IMaterialNewRepository>((i) => MaterialNewRepository(i.get<HasuraConnect>())),
        Bind((i) => MaterialNewController(i.get<IMaterialNewRepository>())),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MaterialNewPage()),
      ];

  static Inject get to => Inject<MaterialNewModule>.of();
}
