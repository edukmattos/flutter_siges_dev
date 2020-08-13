import 'package:flutter_modular/flutter_modular.dart';

abstract class IMaterialShowRepository implements Disposable {
  Future fetchPost();
}
