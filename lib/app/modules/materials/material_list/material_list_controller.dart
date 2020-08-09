import 'package:mobx/mobx.dart';
import 'package:siges/app/models/material_model.dart';

import 'repositories/material_list_repository.dart';

part 'material_list_controller.g.dart';

class MaterialListController = _MaterialListControllerBase
    with _$MaterialListController;

abstract class _MaterialListControllerBase with Store {

  final MaterialListRepository _materialListRepository;

  @observable
  ObservableStream<List<MaterialModel>> materials;

  _MaterialListControllerBase(this._materialListRepository) {
    materialsAll();
  }

  @action
  materialsAll() {
    materials = ObservableStream(_materialListRepository.getMaterialAll());
  }
}
