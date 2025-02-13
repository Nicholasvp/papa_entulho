import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseRepository {
  final String ref = '';
  final fireStore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> createData(Map<String, dynamic> data, {String? uuid}) async {
    try {
      final collection = fireStore.collection(ref);
      DocumentReference result;
      if (uuid != null) {
        result = collection.doc(uuid);
        await result.set(data);
      } else {
        result = await collection.add(data);
        await result.update({'id': result.id});
        return getData(collection: ref, id: result.id);
      }
    } catch (e) {
      return {};
    }
    return {};
  }

  Future<List<Map<String, dynamic>>> getCollection() async {
    try {
      final result = await fireStore.collection(ref).where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
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

  Future<void> deleteData({required String id}) async {
    try {
      await fireStore.collection(ref).doc(id).delete();
    } catch (e) {
      return;
    }
  }

  Future<void> updateData({required String id, required Map<String, dynamic> data}) async {
    try {
      await fireStore.collection(ref).doc(id).update(data);
    } catch (e) {
      return;
    }
  }

  Future<List<Map<String, dynamic>>> searchCollection({required String search, required String field}) async {
    try {
      final result = await fireStore
          .collection(ref)
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where(field, isGreaterThanOrEqualTo: search)
          .where(field, isLessThan: '${search}z')
          .get();
      return result.docs.map((e) => e.data()).toList();
    } catch (e) {
      return [];
    }
  }
}
