import 'package:flutter_modular/flutter_modular.dart';

abstract class IMaterialListRepository implements Disposable {
  Future getMaterialAll();
}
