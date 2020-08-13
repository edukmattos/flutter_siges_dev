import 'package:mobx/mobx.dart';

part 'material_favorites_controller.g.dart';

class MaterialFavoritesController = _MaterialFavoritesControllerBase
    with _$MaterialFavoritesController;

abstract class _MaterialFavoritesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
