import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../config/hasura_config.dart';
import 'product_show_controller.dart';
import 'product_show_page.dart';
import 'repositories/interfaces/product_show_repository_interface.dart';
import 'repositories/product_show_repository.dart';

class ProductShowModule extends ChildModule {
  final String id;

  ProductShowModule({@required this.id});

  @override
  List<Bind> get binds => [
        Bind<IProductShowRepository>(
            (i) => ProductShowRepository(i.get<HasuraConnect>(), id)),
        Bind((i) => ProductShowController(i.get<IProductShowRepository>(), id)),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router("/", child: (_, args) => ProductShowPage()),
      ];

  static Inject get to => Inject<ProductShowModule>.of();
}
