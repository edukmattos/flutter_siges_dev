// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductSearchController on _ProductSearchControllerBase, Store {
  final _$productsAtom = Atom(name: '_ProductSearchControllerBase.products');

  @override
  ObservableStream<List<ProductModel>> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableStream<List<ProductModel>> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$_ProductSearchControllerBaseActionController =
      ActionController(name: '_ProductSearchControllerBase');

  @override
  dynamic productsAll() {
    final _$actionInfo = _$_ProductSearchControllerBaseActionController
        .startAction(name: '_ProductSearchControllerBase.productsAll');
    try {
      return super.productsAll();
    } finally {
      _$_ProductSearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
