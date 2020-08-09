import 'package:flutter_modular/flutter_modular.dart';
import 'package:siges/app/models/material_model.dart';

abstract class IMaterialListRepository implements Disposable {
  Stream<List<MaterialModel>> getMaterialAll();
}
