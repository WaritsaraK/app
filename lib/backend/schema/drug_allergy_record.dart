import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DrugAllergyRecord extends FirestoreRecord {
  DrugAllergyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "drugAllergy" field.
  String? _drugAllergy;
  String get drugAllergy => _drugAllergy ?? '';
  bool hasDrugAllergy() => _drugAllergy != null;

  // "detailDrug" field.
  String? _detailDrug;
  String get detailDrug => _detailDrug ?? '';
  bool hasDetailDrug() => _detailDrug != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _drugAllergy = snapshotData['drugAllergy'] as String?;
    _detailDrug = snapshotData['detailDrug'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('drugAllergy')
          : FirebaseFirestore.instance.collectionGroup('drugAllergy');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('drugAllergy').doc(id);

  static Stream<DrugAllergyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DrugAllergyRecord.fromSnapshot(s));

  static Future<DrugAllergyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DrugAllergyRecord.fromSnapshot(s));

  static DrugAllergyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DrugAllergyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DrugAllergyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DrugAllergyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DrugAllergyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DrugAllergyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDrugAllergyRecordData({
  String? drugAllergy,
  String? detailDrug,
  DocumentReference? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'drugAllergy': drugAllergy,
      'detailDrug': detailDrug,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class DrugAllergyRecordDocumentEquality implements Equality<DrugAllergyRecord> {
  const DrugAllergyRecordDocumentEquality();

  @override
  bool equals(DrugAllergyRecord? e1, DrugAllergyRecord? e2) {
    return e1?.drugAllergy == e2?.drugAllergy &&
        e1?.detailDrug == e2?.detailDrug &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(DrugAllergyRecord? e) =>
      const ListEquality().hash([e?.drugAllergy, e?.detailDrug, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is DrugAllergyRecord;
}
