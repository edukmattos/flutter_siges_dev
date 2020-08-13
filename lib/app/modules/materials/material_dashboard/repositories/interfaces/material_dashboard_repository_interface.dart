import 'package:flutter_modular/flutter_modular.dart';

abstract class IMaterialDashboardRepository implements Disposable {
  Future fetchPost();
}
