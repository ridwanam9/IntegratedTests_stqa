import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/model/tokenfirebase_model.dart';
import 'package:flutter/material.dart';

class TokenFirebaseController {
  final db = FirebaseFirestore.instance.collection('token');

  final StreamController<List<DocumentSnapshot>> _streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => _streamController.stream;

  Future getTokenFirebase(String email) async {
    final result = await db.doc(email).get();
    _streamController.sink.add([result]);
    TokenFirebaseModel tokenFirebaseModel =
        TokenFirebaseModel.fromMap(result.data()!);
    return tokenFirebaseModel.token;
  }

  // remove token firebase
  Future<bool> removeTokenFirebase(String email) async {
    final db = FirebaseFirestore.instance;
    var result = await db.collection('token').doc(email).delete();
    return true;
  }
}
