import 'package:flutter_modular/flutter_modular.dart';

abstract class IClientLocationsListRepository implements Disposable {
  Future fetchPost();
}
