import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oshcaustralia/DataLayer/Providers/dataProvider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection =
    _firestore.collection('Forms-Update');

final CollectionReference _quoteCollection =
    _firestore.collection('quotations');

class Database {
  static Future<String> addItem({
    required Map<String, dynamic> dataMap,
  }) async {
    // Generating Date
    var collectionDate = DateTime.now();
    // Generating Form ID
    var uuid = Uuid();
    var formId = uuid.v5(Uuid.NAMESPACE_URL, '${dataMap['PassportNumber']}');
    // Document Reference
    DocumentReference documentReferencer = _mainCollection.doc(
        '${collectionDate.year}-${collectionDate.month.toString().padLeft(2, '0')}');

    await documentReferencer
        .update({'${dataMap['PassportNumber']}': dataMap})
        .whenComplete(() => print("Form added to the database"))
        .catchError((e) => print(e));
    return "Form added to the database";
  }

  static Stream<List<Map<String, dynamic>>> readItems() {
    CollectionReference notesItemCollection = _mainCollection;
    return Stream.fromFuture(_mainCollection.get().then((querySnapshot) {
      List<Map<String, dynamic>> data = querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
      // for (int i = 0; i < querySnapshot.docs.length; i++) {
      //   var a = querySnapshot.docs[i];
      //   print(a.id);
      //   notesItemCollection.doc(a.id).snapshots();
      // }
      List<Map<String, dynamic>> userData = [];
      for (Map<String, dynamic> object in data) {
        for (var innerObject in object.keys) {
          // print(innerObject);
          userData.add(object[innerObject]);
        }
      }
      return userData;
    }));

    // return notesItemCollection.get();
  }

  static Stream<Map<String, double>> getQuotes(BuildContext context, String adult, String child) {
    return Stream.fromFuture(
        _quoteCollection.doc('$adult-$child').get().then((querySnapshot) {
      Map<String, double> data = {};
      data['cbhs'] = querySnapshot.get('cbhs');
      data['oshc'] = querySnapshot.get('oshc');
      data['nib'] = querySnapshot.get('nib');
      data['allianz'] = querySnapshot.get('allianz');
      data['medibank'] = querySnapshot.get('medibank');
      data['bupa'] = querySnapshot.get('bupa');

      // context.read<DataProvider>().setDataOnKey('ProviderData', {
      // 'cbhs' : querySnapshot.get('cbhs'),
      // 'oshc' : querySnapshot.get('oshc'),
      // 'nib' : querySnapshot.get('nib'),
      // 'allianz' : querySnapshot.get('allianz'),
      // 'medibank' : querySnapshot.get('medibank'),
      // 'bupa' : querySnapshot.get('bupa'),
      // });

      return data;
    }));
  }
}
