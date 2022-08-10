import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('forms');

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
    DocumentReference documentReferencer =
    _mainCollection.doc('${collectionDate.year}-${collectionDate.month.toString().padLeft(2, '0')}').collection(formId).doc('$collectionDate');

    await documentReferencer
        .set(dataMap)
        .whenComplete(() => print("Form added to the database"))
        .catchError((e) => print(e));
    return "Form added to the database";
  }
}