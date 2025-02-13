import 'package:papa_entulho/domain/models/export_models.dart';
import 'package:papa_entulho/domain/repositories/database_repository.dart';

class PapaEntulhoRepository extends DatabaseRepository {
  @override
  String get ref => 'papa_entulhos';

  Future<PapaEntulhoModel> createPapaEntulho(PapaEntulhoModel papaEntulhoModel) async {
    final response = await createData(papaEntulhoModel.toJson());
    return PapaEntulhoModel.fromJson(response);
  }

  Future<List<PapaEntulhoModel>> getPapaEntulhos() async {
    final response = await getCollection();
    return response.map((e) => PapaEntulhoModel.fromJson(e)).toList();
  }

  Future<void> deletePapaEntulho(String id) async {
    await deleteData(id: id);
  }

  Future<void> updatePapaEntulho(String id, PapaEntulhoModel papaEntulhoModel) async {
    await updateData(id: id, data: papaEntulhoModel.toJson());
  }

  Future<List<PapaEntulhoModel>> searchPapaEntulho({required String search, required String field}) async {
    final response = await searchCollection(search: search, field: field);
    return response.map((e) => PapaEntulhoModel.fromJson(e)).toList();
  }

  //pegar a quantidade de papaentulhos alugados
  Future<int> getQuantityPapaEntulhos() async {
    final listPapaEntulhos = await getPapaEntulhos();
    int totalQuantity = 0;
    for (var papaEntulho in listPapaEntulhos) {
      totalQuantity += papaEntulho.quantity;
    }
    return totalQuantity;
  }
}
