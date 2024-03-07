import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedInfoRecord extends FirestoreRecord {
  MedInfoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "data" field.
  List<String>? _data;
  List<String> get data => _data ?? const [];
  bool hasData() => _data != null;

  void _initializeFields() {
    _data = getDataList(snapshotData['data']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medInfo');

  static Stream<MedInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedInfoRecord.fromSnapshot(s));

  static Future<MedInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedInfoRecord.fromSnapshot(s));

  static MedInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedInfoRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class MedInfoRecordDocumentEquality implements Equality<MedInfoRecord> {
  const MedInfoRecordDocumentEquality();

  @override
  bool equals(MedInfoRecord? e1, MedInfoRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.data, e2?.data);
  }

  @override
  int hash(MedInfoRecord? e) => const ListEquality().hash([e?.data]);

  @override
  bool isValidKey(Object? o) => o is MedInfoRecord;
}
