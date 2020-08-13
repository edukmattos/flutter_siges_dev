import 'package:flutter_modular/flutter_modular.dart';

abstract class IClientNewRepository implements Disposable {
  Future<bool> repositorySave(String einSsa, String name, String email);
}
