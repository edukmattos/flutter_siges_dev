import 'package:dio/native_imp.dart';
import 'interfaces/material_show_repository_interface.dart';

class MaterialShowRepository implements IMaterialShowRepository {
  final DioForNative client;

  MaterialShowRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
