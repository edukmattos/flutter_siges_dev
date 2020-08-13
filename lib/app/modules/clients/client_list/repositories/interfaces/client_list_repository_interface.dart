import 'package:flutter_modular/flutter_modular.dart';

abstract class IClientListRepository implements Disposable {
  Future fetchPost();
}
