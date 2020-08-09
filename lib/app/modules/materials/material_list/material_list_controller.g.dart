// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MaterialListController on _MaterialListControllerBase, Store {
  final _$materialsAtom = Atom(name: '_MaterialListControllerBase.materials');

  @override
  ObservableStream<List<MaterialModel>> get materials {
    _$materialsAtom.reportRead();
    return super.materials;
  }

  @override
  set materials(ObservableStream<List<MaterialModel>> value) {
    _$materialsAtom.reportWrite(value, super.materials, () {
      super.materials = value;
    });
  }

  final _$_MaterialListControllerBaseActionController =
      ActionController(name: '_MaterialListControllerBase');

  @override
  dynamic materialsAll() {
    final _$actionInfo = _$_MaterialListControllerBaseActionController
        .startAction(name: '_MaterialListControllerBase.materialsAll');
    try {
      return super.materialsAll();
    } finally {
      _$_MaterialListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
materials: ${materials}
    ''';
  }
}
