import 'package:mobx/mobx.dart';
import 'package:siges/app/models/units_measure_model.dart';
import 'package:siges/app/modules/units_measure/units_measure_list/repositories/units_measure_list_repository.dart';

part 'units_measure_list_controller.g.dart';

class UnitsMeasureListController = _UnitsMeasureListControllerBase
    with _$UnitsMeasureListController;

abstract class _UnitsMeasureListControllerBase with Store {

  final UnitsMeasureListRepository _unitsMeasureListRepository;

  @observable
  ObservableStream<List<UnitsMeasureModel>> unitsMeasure;

  _UnitsMeasureListControllerBase(this._unitsMeasureListRepository) {
    unitsMeasureAll();
  }

  @action
  unitsMeasureAll() {
    unitsMeasure = ObservableStream(_unitsMeasureListRepository.getUnitsMeasureAll());
  }

  
}
