import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../models/units_measure_model.dart';

abstract class IUnitsMeasureListRepository implements Disposable {
  Stream<List<UnitsMeasureModel>> getUnitsMeasureAll();
}
