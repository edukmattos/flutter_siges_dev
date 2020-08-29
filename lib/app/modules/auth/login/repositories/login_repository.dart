import 'package:dio/native_imp.dart';
import 'interfaces/login_repository_interface.dart';

class LoginRepository implements ILoginRepository {
  final DioForNative client;

  LoginRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
