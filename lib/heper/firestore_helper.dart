import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/global.dart';

class FireStoreHelper {
  FireStoreHelper._();

  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  CollectionReference? collectionReference;

  connectCollection() async {
    collectionReference = fireStore.collection('${Global.all}');
  }

  Future<void> addUser({
    required String name,
    required int age,
    required String experience,
    required String number,
    required String position,
  }) async {
    connectCollection();

    String nId = DateTime.now().millisecondsSinceEpoch.toString();

    await collectionReference!
        .doc(nId)
        .set({
          'id': nId,
          'name': name,
          'age': age,
          'experience': experience,
          'number': number,
          'position': position,
        })
        .then(
          (value) => print("User is add...."),
        )
        .catchError((error) => print("$error"));
  }

  removeUser({required String id}) {
    connectCollection();

    collectionReference!
        .doc(id)
        .delete()
        .then((value) => print("User delete"))
        .catchError((error) => print("User not delete"));
  }

  editUser({required String id, required Map<Object, Object> data}) {
    connectCollection();

    collectionReference!
        .doc(id)
        .update(data)
        .then((value) => print("User Edit"))
        .catchError(
          (error) =>
              print("====================\n$error\n======================"),
        );
  }

  Stream<QuerySnapshot<Object?>> getUser() {
    connectCollection();

    return collectionReference!.snapshots();
  }
}
