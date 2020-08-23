import 'package:hasura_connect/hasura_connect.dart';

import '../../../../models/product_model.dart';
import '../../product_document.dart';
import 'interfaces/product_search_repository_interface.dart';

class ProductSearchRepository implements IProductSearchRepository {
  final HasuraConnect _hasuraConnect;

  ProductSearchRepository(this._hasuraConnect);

  @override
  Stream<List<ProductModel>> getProductAll() {
    var query = docProductAll;

    var snapshot = _hasuraConnect.subscription(query);

    return snapshot
        .map((data) => ProductModel.fromJsonList(data['data']['products']));
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
