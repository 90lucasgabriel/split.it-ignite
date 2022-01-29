import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:splitit/shared/models/base.dart';

class FirebaseRepository {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  Future<String> create<T extends Base>(T data) async {
    try {
      final response =
          await firestore.collection(data.collection).add(data.toMap());

      return response.id;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> get(String collection) async {
    try {
      final response = await firestore.collection(collection).get();
      return response.docs.map((doc) => doc.data()).toList();
    } catch (error) {
      rethrow;
    }
  }

  update() {}

  Future<List<Map<String, dynamic>>> where<T extends Base>({
    required String key,
    required String value,
    required String collection,
  }) async {
    try {
      final response = await firestore
          .collection(collection)
          .where(key, isEqualTo: value)
          .get();

      final parsedResponse = response.docs.map((doc) => doc.data()).toList();

      return parsedResponse;
    } catch (error) {
      rethrow;
    }
  }

  firstWhere() {}
}
