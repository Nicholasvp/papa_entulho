import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseRepository {
  final String ref = '';
  final fireStore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> saveData(Map<String, dynamic> data, {String? uuid}) async {
    try {
      final collection = fireStore.collection(ref);
      DocumentReference result;
      if (uuid != null) {
        result = collection.doc(uuid);
        await result.set(data);
      } else {
        result = await collection.add(data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Map<String, dynamic>> getData() async {
    // Get data from database
    return {};
  }

  Future<void> deleteData() async {
    // Delete data from database
  }

  Future<void> updateData(String data) async {
    // Update data in database
  }
}
