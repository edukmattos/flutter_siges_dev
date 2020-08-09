import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../config/hasura_config.dart';
import 'repositories/interfaces/units_measure_list_repository_interface.dart';
import 'repositories/units_measure_list_repository.dart';
import 'units_measure_list_controller.dart';
import 'units_measure_list_page.dart';

class UnitsMeasureListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IUnitsMeasureListRepository>(
            (i) => UnitsMeasureListRepository(i.get<HasuraConnect>())),
        Bind((i) => UnitsMeasureListController(i.get<IUnitsMeasureListRepository>())),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => UnitsMeasureListPage()),
      ];

  static Inject get to => Inject<UnitsMeasureListModule>.of();
}
