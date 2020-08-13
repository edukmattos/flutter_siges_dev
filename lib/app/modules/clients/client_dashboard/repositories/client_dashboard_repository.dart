import 'package:dio/native_imp.dart';
import 'interfaces/client_dashboard_repository_interface.dart';

class ClientDashboardRepository implements IClientDashboardRepository {
  final DioForNative client;

  ClientDashboardRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
