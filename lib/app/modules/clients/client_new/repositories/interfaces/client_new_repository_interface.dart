import 'package:flutter_modular/flutter_modular.dart';

abstract class IClientNewRepository implements Disposable {
  Future<bool> repositoryClientEmailUnique(String email);
  Future<bool> repositoryClientEinSsaUnique(String einSsa);
  Future<bool> repositoryClientSave(String einSsa, String name, String email);
}
