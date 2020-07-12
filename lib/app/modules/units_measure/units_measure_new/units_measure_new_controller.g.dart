// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'units_measure_new_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UnitsMeasureNewController on _UnitsMeasureNewControllerBase, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_UnitsMeasureNewControllerBase.isFormValid'))
          .value;

  final _$codeAtom = Atom(name: '_UnitsMeasureNewControllerBase.code');

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
      Atom(name: '_UnitsMeasureNewControllerBase.description');

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

  final _$saveAsyncAction = AsyncAction('_UnitsMeasureNewControllerBase.save');

  @override
  Future<bool> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$_UnitsMeasureNewControllerBaseActionController =
      ActionController(name: '_UnitsMeasureNewControllerBase');

  @override
  dynamic changeCode(String value) {
    final _$actionInfo = _$_UnitsMeasureNewControllerBaseActionController
        .startAction(name: '_UnitsMeasureNewControllerBase.changeCode');
    try {
      return super.changeCode(value);
    } finally {
      _$_UnitsMeasureNewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescription(String value) {
    final _$actionInfo = _$_UnitsMeasureNewControllerBaseActionController
        .startAction(name: '_UnitsMeasureNewControllerBase.changeDescription');
    try {
      return super.changeDescription(value);
    } finally {
      _$_UnitsMeasureNewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
code: ${code},
description: ${description},
isFormValid: ${isFormValid}
    ''';
  }
}
