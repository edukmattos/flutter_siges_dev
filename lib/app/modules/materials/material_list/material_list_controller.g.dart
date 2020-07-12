// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MaterialListController on _MaterialListControllerBase, Store {
  final _$valueAtom = Atom(name: '_MaterialListControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_MaterialListControllerBaseActionController =
      ActionController(name: '_MaterialListControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_MaterialListControllerBaseActionController
        .startAction(name: '_MaterialListControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_MaterialListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
