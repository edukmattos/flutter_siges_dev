import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'product_show_controller.dart';
import 'product_show_page.dart';
import 'repositories/interfaces/product_show_repository_interface.dart';
import 'repositories/product_show_repository.dart';

class ProductShowModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IProductShowRepository>((i) => ProductShowRepository(Dio())),
        Bind((i) => ProductShowController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProductShowPage()),
      ];

  static Inject get to => Inject<ProductShowModule>.of();
}
