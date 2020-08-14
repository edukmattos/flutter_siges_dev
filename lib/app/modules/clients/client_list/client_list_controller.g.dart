// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientListController on _ClientListControllerBase, Store {
  final _$clientsAtom = Atom(name: '_ClientListControllerBase.clients');

  @override
  ObservableStream<List<ClientModel>> get clients {
    _$clientsAtom.reportRead();
    return super.clients;
  }

  @override
  set clients(ObservableStream<List<ClientModel>> value) {
    _$clientsAtom.reportWrite(value, super.clients, () {
      super.clients = value;
    });
  }

  final _$_ClientListControllerBaseActionController =
      ActionController(name: '_ClientListControllerBase');

  @override
  dynamic clientsAll() {
    final _$actionInfo = _$_ClientListControllerBaseActionController
        .startAction(name: '_ClientListControllerBase.clientsAll');
    try {
      return super.clientsAll();
    } finally {
      _$_ClientListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clients: ${clients}
    ''';
  }
}
