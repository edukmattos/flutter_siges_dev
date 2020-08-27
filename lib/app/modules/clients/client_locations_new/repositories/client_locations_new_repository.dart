import 'package:dio/native_imp.dart';
import 'interfaces/client_locations_new_repository_interface.dart';

class ClientLocationsNewRepository implements IClientLocationsNewRepository {
  final DioForNative client;

  ClientLocationsNewRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
