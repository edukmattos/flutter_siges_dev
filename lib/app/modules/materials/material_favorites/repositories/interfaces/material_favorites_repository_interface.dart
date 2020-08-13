import 'package:flutter_modular/flutter_modular.dart';

abstract class IMaterialFavoritesRepository implements Disposable {
  Future fetchPost();
}
