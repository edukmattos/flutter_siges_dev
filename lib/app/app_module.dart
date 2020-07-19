import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/units_measure/units_measure_list/units_measure_list_module.dart';
import 'modules/units_measure/units_measure_new/units_measure_new_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
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
