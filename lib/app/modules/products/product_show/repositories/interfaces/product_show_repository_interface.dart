import 'package:flutter_modular/flutter_modular.dart';

abstract class IProductShowRepository implements Disposable {
  Future fetchPost();
}
