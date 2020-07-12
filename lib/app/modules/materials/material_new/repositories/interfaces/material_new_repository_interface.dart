import 'package:flutter_modular/flutter_modular.dart';

abstract class IMaterialNewRepository implements Disposable {
  Future<bool> repositorySave(String code, String description);
}
