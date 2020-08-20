import 'package:flutter_modular/flutter_modular.dart';

abstract class IClientShowRepository implements Disposable {
  Future fetchPost();
}
