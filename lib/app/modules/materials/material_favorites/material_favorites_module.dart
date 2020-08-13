import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'material_favorites_controller.dart';
import 'material_favorites_page.dart';
import 'repositories/interfaces/material_favorites_repository_interface.dart';
import 'repositories/material_favorites_repository.dart';

class MaterialFavoritesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IMaterialFavoritesRepository>(
            (i) => MaterialFavoritesRepository(Dio())),
        Bind((i) => MaterialFavoritesController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => MaterialFavoritesPage()),
      ];

  static Inject get to => Inject<MaterialFavoritesModule>.of();
}
