import 'package:dio/native_imp.dart';
import 'interfaces/material_favorites_repository_interface.dart';

class MaterialFavoritesRepository implements IMaterialFavoritesRepository {
  final DioForNative client;

  MaterialFavoritesRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
