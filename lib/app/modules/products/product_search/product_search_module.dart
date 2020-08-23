import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../config/hasura_config.dart';
import 'product_search_controller.dart';
import 'product_search_page.dart';
import 'repositories/interfaces/product_search_repository_interface.dart';
import 'repositories/product_search_repository.dart';

class ProductSearchModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IProductSearchRepository>(
            (i) => ProductSearchRepository(i.get<HasuraConnect>())),
        Bind((i) => ProductSearchController(i.get<IProductSearchRepository>())),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProductSearchPage()),
      ];

  static Inject get to => Inject<ProductSearchModule>.of();
}
