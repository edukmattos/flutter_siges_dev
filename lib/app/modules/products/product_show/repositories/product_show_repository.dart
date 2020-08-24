import 'package:hasura_connect/hasura_connect.dart';
import '../../../../models/product_model.dart';
import '../../product_document.dart';
import 'interfaces/product_show_repository_interface.dart';

class ProductShowRepository implements IProductShowRepository {
  final HasuraConnect _hasuraConnect;
  final String id;

  ProductShowRepository(this._hasuraConnect, this.id);

  @override
  Stream<List<ProductModel>> getProductById() {
    var query = docProductById;

    var snapshot = _hasuraConnect.subscription(query);

    return snapshot
        .map((data) => ProductModel.fromJsonList(data['data']['products']));
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
