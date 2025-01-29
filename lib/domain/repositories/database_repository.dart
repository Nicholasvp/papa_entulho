import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseRepository {
  final String ref = '';
  final fireStore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> saveData(Map<String, dynamic> data, {String? uuid}) async {
    try {
      final collection = fireStore.collection(ref);
      DocumentReference result;
      if (uuid != null) {
        result = collection.doc(uuid);
        await result.set(data);
      } else {
        result = await collection.add(data);
        await result.update({'id': result.id});
      }
    } catch (e) {
      return {};
    }
    return {};
  }

  Future<List<Map<String, dynamic>>> getCollection() async {
    try {
      final result = await fireStore.collection(ref).get();
      return result.docs.map((e) => e.data()).toList();
    } catch (e) {
      return [];
    }
  }

  Future<Map<String, dynamic>> getData({required String collection, required String id}) async {
    try {
      final result = await fireStore.collection(collection).doc(id).get();
      return result.data() ?? {};
    } catch (e) {
      return {};
    }
  }

  Future<void> deleteData() async {
    // Delete data from database
  }

  Future<void> updateData(String data) async {
    // Update data in database
  }
}
