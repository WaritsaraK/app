import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiseaseRecord extends FirestoreRecord {
  DiseaseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "disease" field.
  String? _disease;
  String get disease => _disease ?? '';
  bool hasDisease() => _disease != null;

  // "detailDisease" field.
  String? _detailDisease;
  String get detailDisease => _detailDisease ?? '';
  bool hasDetailDisease() => _detailDisease != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _disease = snapshotData['disease'] as String?;
    _detailDisease = snapshotData['detailDisease'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('disease')
          : FirebaseFirestore.instance.collectionGroup('disease');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('disease').doc(id);

  static Stream<DiseaseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiseaseRecord.fromSnapshot(s));

  static Future<DiseaseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiseaseRecord.fromSnapshot(s));

  static DiseaseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiseaseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiseaseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiseaseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiseaseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiseaseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiseaseRecordData({
  String? disease,
  String? detailDisease,
  DocumentReference? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'disease': disease,
      'detailDisease': detailDisease,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiseaseRecordDocumentEquality implements Equality<DiseaseRecord> {
  const DiseaseRecordDocumentEquality();

  @override
  bool equals(DiseaseRecord? e1, DiseaseRecord? e2) {
    return e1?.disease == e2?.disease &&
        e1?.detailDisease == e2?.detailDisease &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(DiseaseRecord? e) =>
      const ListEquality().hash([e?.disease, e?.detailDisease, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is DiseaseRecord;
}
