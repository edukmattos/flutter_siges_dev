import 'package:mobx/mobx.dart';
import 'package:siges/app/app_controller.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AppController appController;

  _HomeControllerBase(this.appController);
}
