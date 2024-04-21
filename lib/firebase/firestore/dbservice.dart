import 'package:cloud_firestore/cloud_firestore.dart';

class DbService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getCities() {
    return _db.collection("cities").snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            return doc.data();
          },
        ).toList();
      },
    );
  }
}
