import 'package:papa_entulho/domain/models/export_models.dart';
import 'package:papa_entulho/domain/repositories/database_repository.dart';

class PapaEntulhoRepository extends DatabaseRepository {
  @override
  String get ref => 'papa_entulhos';

  Future<PapaEntulhoModel> createPapaEntulho(
      String description, String address, String phone, DateTime dateInitial, DateTime dateFinal, int quantity) async {
    final papaEntulhoModel = PapaEntulhoModel(
        description: description,
        address: address,
        phone: phone,
        dateInitial: dateInitial,
        dateFinal: dateFinal,
        quantity: quantity);

    final response = await saveData(papaEntulhoModel.toJson());
    return PapaEntulhoModel.fromJson(response);
  }
}
