import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseServieces {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// this Methods it firebase options for cloction
////////////////////////////////////////////////

//addDoc to colection and docid is defiened by firebase (add Method)
  Future<void> addDoc({
    required String colecName,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(colecName).add(data);
  }

//setDoc to colection and docId id defineIt usualy is user.Uid
//if doc doesn`t exist it added and if exist it updated delet old data and put new data
//if setOption merged true field that not updated dont deleted
  Future<void> addDocwithId({
    required String colecName,
    required Map<String, dynamic> data,
    @required String? docId,
    @required bool? setOptionMerged,
  }) async {
    await _firestore
        .collection(colecName)
        .doc(docId)
        .set(data, SetOptions(merge: setOptionMerged));
  }

// get all docs in required CloctionName
  Future<QuerySnapshot> getDocs({
    required String colecName,
  }) async {
    QuerySnapshot snapshot = await _firestore.collection(colecName).get();
    return snapshot;
  }

// get all docs in required ColectionName whith filed == value
  Future<QuerySnapshot> getDocsWhereFiledEqualValue({
    required String colecName,
    required String filed,
    required String value,
  }) async {
    QuerySnapshot snapshot = await _firestore
        .collection(colecName)
        .where(filed, isEqualTo: value)
        .get();
    return snapshot;
  }

//get specific doc data with it doc id
  Future<DocumentSnapshot> getDoc({
    required String colecName,
    required String docId,
  }) async {
    DocumentSnapshot docSnapshot =
        await _firestore.collection(colecName).doc(docId).get();
    return docSnapshot;
  }

// update Doc with it DocId
  Future<void> updateDoc({
    required String colecName,
    required Map<String, dynamic> data,
    required String docId,
  }) async {
    await _firestore.collection(colecName).doc(docId).update(data);
  }

//delet Doc with it DocId
  Future<void> deleteDoc({
    required String colecName,
    required String docId,
  }) async {
    await _firestore.collection(colecName).doc(docId).delete();
  }
//------------------------------------------------------------------------------------------------
// this Methods it firebase options for subColection
////////////////////////////////////////////////////

//addDoc to  subcolection of coliction and docid is defiened by firebase (add Method)
  Future<void> addSubColectionDoc({
    required String colecName,
    required String subColecName,
    required Map<String, dynamic> data,
    required String docId,
  }) async {
    await _firestore
        .collection(colecName)
        .doc(docId)
        .collection(subColecName)
        .add(data);
  }

//setDoc to subcolection of coliction and docId id defineIt usualy is user.Uid
//if doc doesn`t exist it added and if exist it updated delet old data and put new data
//if setOption merged true field that not updated dont deleted
  Future<void> addSubColectionDocWithId({
    required String colecName,
    required String subColecName,
    required String docId,
    required Map<String, dynamic> data,
    @required String? subcoldocId,
    @required bool? setOptionMerged,
  }) async {
    await _firestore
        .collection(colecName)
        .doc(docId)
        .collection(subColecName)
        .doc(subcoldocId)
        .set(data, SetOptions(merge: setOptionMerged));
  }

// get all docs in required subcolection of coliction
  Future<QuerySnapshot> getSubColectionDocs(
      {required String colecName,
      required String docId,
      required String subColecName}) async {
    QuerySnapshot snapshot = await _firestore
        .collection(colecName)
        .doc(docId)
        .collection(subColecName)
        .get();
    return snapshot;
  }

// get all docs in required ColectionName whith filed == value
  Future<QuerySnapshot> getSubColectionDocsWhereFiledEqualValue({
    required String colecName,
    required String docId,
    required String subColecName,
    required String filed,
    required String value,
  }) async {
    QuerySnapshot snapshot = await _firestore
        .collection(colecName)
        .doc(docId)
        .collection(subColecName)
        .where(filed, isEqualTo: value)
        .get();
    return snapshot;
  }

//get specific doc data with it doc id
  Future<DocumentSnapshot> getSubColectionDoc({
    required String colecName,
    required String docId,
    required String subColecName,
    required String subColecdocId,
  }) async {
    DocumentSnapshot docSnapshot = await _firestore
        .collection(colecName)
        .doc(docId)
        .collection(subColecName)
        .doc(subColecdocId)
        .get();
    return docSnapshot;
  }

// update Doc with it DocId
  Future<void> updateSubColectDoc({
    required String colecName,
    required Map<String, dynamic> data,
    required String docId,
    required String subColecName,
    required String subColecdocId,
  }) async {
    await _firestore
        .collection(colecName)
        .doc(docId)
        .collection(subColecName)
        .doc(subColecdocId)
        .update(data);
  }

//delet Doc with it DocId
  Future<void> deleteSubColectionDoc({
    required String colecName,
    required String docId,
    required String subColecName,
    required String subColecdocId,
  }) async {
    await _firestore
        .collection(colecName)
        .doc(docId)
        .collection(subColecName)
        .doc(subColecdocId)
        .delete();
  }
}
