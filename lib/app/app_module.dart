import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/clients/client_list/client_list_module.dart';
import 'modules/clients/client_locations_list/client_locations_list_module.dart';
import 'modules/clients/client_locations_new/client_locations_new_module.dart';
import 'modules/clients/client_new/client_new_module.dart';
import 'modules/clients/client_show/client_show_module.dart';
import 'modules/materials/material_dashboard/material_dashboard_module.dart';
import 'modules/materials/material_list/material_list_module.dart';
import 'modules/materials/material_new/material_new_module.dart';
import 'modules/products/product_show/product_show_page.dart';
import 'modules/units_measure/units_measure_list/units_measure_list_module.dart';
import 'modules/units_measure/units_measure_new/units_measure_new_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: ClientShowModule()),
        //MATERIALS
        Router('/material/dashboard',
            module: MaterialDashboardModule(),
            transition: TransitionType.rightToLeft),
        Router('/material/new',
            module: MaterialNewModule(),
            transition: TransitionType.rightToLeft),
        Router('/material/list',
            module: MaterialListModule(),
            transition: TransitionType.rightToLeft),
        Router("/product/show/:id",
            child: (_, args) => ProductShowPage(id: args.params['id']),
            transition: TransitionType.rightToLeft),
        //CLIENTS
        Router('/client/new',
            module: ClientNewModule(), transition: TransitionType.rightToLeft),
        Router('/client/list',
            module: ClientListModule(), transition: TransitionType.rightToLeft),
        Router('/client_locations/new',
            module: ClientLocationsNewModule(),
            transition: TransitionType.rightToLeft),
        Router('/client_locations/list',
            module: ClientLocationsListModule(),
            transition: TransitionType.rightToLeft),
        //UNITS_MEASURE
        Router('/units_measure/new',
            module: UnitsMeasureNewModule(),
            transition: TransitionType.rightToLeft),
        Router('/units_measure/list',
            module: UnitsMeasureListModule(),
            transition: TransitionType.rightToLeft),
      ];

  @override
  Widget get bootstrap => AppWidget(controller: to.get<AppController>());

  static Inject get to => Inject<AppModule>.of();
}
