// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_locations_new_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientLocationsNewController
    on _ClientLocationsNewControllerBase, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_ClientLocationsNewControllerBase.isFormValid'))
          .value;

  final _$descriptionAtom =
      Atom(name: '_ClientLocationsNewControllerBase.description');

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

  final _$_ClientLocationsNewControllerBaseActionController =
      ActionController(name: '_ClientLocationsNewControllerBase');

  @override
  dynamic changeDescription(String value) {
    final _$actionInfo =
        _$_ClientLocationsNewControllerBaseActionController.startAction(
            name: '_ClientLocationsNewControllerBase.changeDescription');
    try {
      return super.changeDescription(value);
    } finally {
      _$_ClientLocationsNewControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void save() {
    final _$actionInfo = _$_ClientLocationsNewControllerBaseActionController
        .startAction(name: '_ClientLocationsNewControllerBase.save');
    try {
      return super.save();
    } finally {
      _$_ClientLocationsNewControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
isFormValid: ${isFormValid}
    ''';
  }
}
