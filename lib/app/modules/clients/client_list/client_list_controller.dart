import 'package:mobx/mobx.dart';
import 'package:siges/app/models/client_model.dart';
import 'package:siges/app/modules/clients/client_list/repositories/client_list_repository.dart';

part 'client_list_controller.g.dart';

class ClientListController = _ClientListControllerBase
    with _$ClientListController;

abstract class _ClientListControllerBase with Store {

  final ClientListRepository _clientListRepository;

  @observable
  ObservableStream<List<ClientModel>> clients;

  _ClientListControllerBase(this._clientListRepository) {
    clientsAll();
  }

  @action
  clientsAll() {
    clients = ObservableStream(_clientListRepository.getClientAll());
  }
}
