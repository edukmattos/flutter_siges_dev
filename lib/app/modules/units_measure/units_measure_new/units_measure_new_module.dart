import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../config/hasura_config.dart';
import 'repositories/interfaces/units_measure_new_repository_interface.dart';
import 'repositories/units_measure_new_repository.dart';
import 'units_measure_new_controller.dart';
import 'units_measure_new_page.dart';

class UnitsMeasureNewModule extends ChildModule {  

  @override
  List<Bind> get binds => [
        Bind<IUnitsMeasureNewRepository>(
            (i) => UnitsMeasureNewRepository(i.get<HasuraConnect>())),
        Bind((i) => UnitsMeasureNewController(i.get<UnitsMeasureNewRepository>())),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => UnitsMeasureNewPage()),
      ];

  static Inject get to => Inject<UnitsMeasureNewModule>.of();
}
