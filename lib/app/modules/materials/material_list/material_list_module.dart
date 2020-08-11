import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:siges/app/config/hasura_config.dart';
import 'package:siges/app/modules/materials/material_new/material_new_module.dart';

import 'material_list_controller.dart';
import 'material_list_page.dart';
import 'repositories/interfaces/material_list_repository_interface.dart';
import 'repositories/material_list_repository.dart';

class MaterialListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IMaterialListRepository>((i) => MaterialListRepository(i.get<HasuraConnect>())),
        Bind((i) => MaterialListController(i.get<IMaterialListRepository>())),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MaterialListPage()),
        Router('/material_new',
            module: MaterialNewModule(),
            transition: TransitionType.rightToLeft),
      ];

  static Inject get to => Inject<MaterialListModule>.of();
}
