import 'package:dio/native_imp.dart';
import 'interfaces/product_show_repository_interface.dart';

class ProductShowRepository implements IProductShowRepository {
  final DioForNative client;

  ProductShowRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
