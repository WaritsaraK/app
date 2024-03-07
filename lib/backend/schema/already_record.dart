import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlreadyRecord extends FirestoreRecord {
  AlreadyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "IDsmed" field.
  List<String>? _iDsmed;
  List<String> get iDsmed => _iDsmed ?? const [];
  bool hasIDsmed() => _iDsmed != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "confirm" field.
  bool? _confirm;
  bool get confirm => _confirm ?? false;
  bool hasConfirm() => _confirm != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _iDsmed = getDataList(snapshotData['IDsmed']);
    _time = snapshotData['time'] as DateTime?;
    _confirm = snapshotData['confirm'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('already')
          : FirebaseFirestore.instance.collectionGroup('already');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('already').doc(id);

  static Stream<AlreadyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlreadyRecord.fromSnapshot(s));

  static Future<AlreadyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlreadyRecord.fromSnapshot(s));

  static AlreadyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AlreadyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlreadyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlreadyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlreadyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlreadyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlreadyRecordData({
  DateTime? time,
  bool? confirm,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time': time,
      'confirm': confirm,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlreadyRecordDocumentEquality implements Equality<AlreadyRecord> {
  const AlreadyRecordDocumentEquality();

  @override
  bool equals(AlreadyRecord? e1, AlreadyRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.iDsmed, e2?.iDsmed) &&
        e1?.time == e2?.time &&
        e1?.confirm == e2?.confirm;
  }

  @override
  int hash(AlreadyRecord? e) =>
      const ListEquality().hash([e?.iDsmed, e?.time, e?.confirm]);

  @override
  bool isValidKey(Object? o) => o is AlreadyRecord;
}
