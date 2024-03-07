import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotiRecord extends FirestoreRecord {
  NotiRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  List<String>? _id;
  List<String> get id => _id ?? const [];
  bool hasId() => _id != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = getDataList(snapshotData['id']);
    _time = snapshotData['time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('noti')
          : FirebaseFirestore.instance.collectionGroup('noti');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('noti').doc(id);

  static Stream<NotiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotiRecord.fromSnapshot(s));

  static Future<NotiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotiRecord.fromSnapshot(s));

  static NotiRecord fromSnapshot(DocumentSnapshot snapshot) => NotiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotiRecordData({
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotiRecordDocumentEquality implements Equality<NotiRecord> {
  const NotiRecordDocumentEquality();

  @override
  bool equals(NotiRecord? e1, NotiRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.id, e2?.id) && e1?.time == e2?.time;
  }

  @override
  int hash(NotiRecord? e) => const ListEquality().hash([e?.id, e?.time]);

  @override
  bool isValidKey(Object? o) => o is NotiRecord;
}
