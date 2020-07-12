// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'units_measure_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UnitsMeasureListController on _UnitsMeasureListControllerBase, Store {
  final _$unitsMeasureAtom =
      Atom(name: '_UnitsMeasureListControllerBase.unitsMeasure');

  @override
  ObservableStream<List<UnitsMeasureModel>> get unitsMeasure {
    _$unitsMeasureAtom.reportRead();
    return super.unitsMeasure;
  }

  @override
  set unitsMeasure(ObservableStream<List<UnitsMeasureModel>> value) {
    _$unitsMeasureAtom.reportWrite(value, super.unitsMeasure, () {
      super.unitsMeasure = value;
    });
  }

  @override
  String toString() {
    return '''
unitsMeasure: ${unitsMeasure}
    ''';
  }
}
