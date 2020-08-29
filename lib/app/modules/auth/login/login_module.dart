import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';
import 'login_page.dart';
import 'repositories/interfaces/login_repository_interface.dart';
import 'repositories/login_repository.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ILoginRepository>((i) => LoginRepository(Dio())),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
