// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_new_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MaterialNewController on _MaterialNewControllerBase, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_MaterialNewControllerBase.isFormValid'))
          .value;

  final _$codeAtom = Atom(name: '_MaterialNewControllerBase.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$descriptionAtom =
      Atom(name: '_MaterialNewControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$unitsMeasureOptionsAtom =
      Atom(name: '_MaterialNewControllerBase.unitsMeasureOptions');

  @override
  List<UnitsMeasureModel> get unitsMeasureOptions {
    _$unitsMeasureOptionsAtom.reportRead();
    return super.unitsMeasureOptions;
  }

  @override
  set unitsMeasureOptions(List<UnitsMeasureModel> value) {
    _$unitsMeasureOptionsAtom.reportWrite(value, super.unitsMeasureOptions, () {
      super.unitsMeasureOptions = value;
    });
  }

  final _$unitMeasureSelectedAtom =
      Atom(name: '_MaterialNewControllerBase.unitMeasureSelected');

  @override
  UnitsMeasureModel get unitMeasureSelected {
    _$unitMeasureSelectedAtom.reportRead();
    return super.unitMeasureSelected;
  }

  @override
  set unitMeasureSelected(UnitsMeasureModel value) {
    _$unitMeasureSelectedAtom.reportWrite(value, super.unitMeasureSelected, () {
      super.unitMeasureSelected = value;
    });
  }

  final _$unitsMeasureAllAsyncAction =
      AsyncAction('_MaterialNewControllerBase.unitsMeasureAll');

  @override
  Future unitsMeasureAll() {
    return _$unitsMeasureAllAsyncAction.run(() => super.unitsMeasureAll());
  }

  final _$saveAsyncAction = AsyncAction('_MaterialNewControllerBase.save');

  @override
  Future<bool> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$_MaterialNewControllerBaseActionController =
      ActionController(name: '_MaterialNewControllerBase');

  @override
  dynamic changeCode(String value) {
    final _$actionInfo = _$_MaterialNewControllerBaseActionController
        .startAction(name: '_MaterialNewControllerBase.changeCode');
    try {
      return super.changeCode(value);
    } finally {
      _$_MaterialNewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescription(String value) {
    final _$actionInfo = _$_MaterialNewControllerBaseActionController
        .startAction(name: '_MaterialNewControllerBase.changeDescription');
    try {
      return super.changeDescription(value);
    } finally {
      _$_MaterialNewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUnitMeasureSelected(UnitsMeasureModel unitMeasureSelected) {
    final _$actionInfo =
        _$_MaterialNewControllerBaseActionController.startAction(
            name: '_MaterialNewControllerBase.changeUnitMeasureSelected');
    try {
      return super.changeUnitMeasureSelected(unitMeasureSelected);
    } finally {
      _$_MaterialNewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
code: ${code},
description: ${description},
unitsMeasureOptions: ${unitsMeasureOptions},
unitMeasureSelected: ${unitMeasureSelected},
isFormValid: ${isFormValid}
    ''';
  }
}
