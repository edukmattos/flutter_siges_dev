// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_show_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductShowController on _ProductShowControllerBase, Store {
  final _$productAtom = Atom(name: '_ProductShowControllerBase.product');

  @override
  ObservableStream<List<ProductModel>> get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(ObservableStream<List<ProductModel>> value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  final _$_ProductShowControllerBaseActionController =
      ActionController(name: '_ProductShowControllerBase');

  @override
  dynamic productById() {
    final _$actionInfo = _$_ProductShowControllerBaseActionController
        .startAction(name: '_ProductShowControllerBase.productById');
    try {
      return super.productById();
    } finally {
      _$_ProductShowControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product}
    ''';
  }
}
