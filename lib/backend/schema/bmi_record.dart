import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BmiRecord extends FirestoreRecord {
  BmiRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "recordTime" field.
  DateTime? _recordTime;
  DateTime? get recordTime => _recordTime;
  bool hasRecordTime() => _recordTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _weight = castToType<double>(snapshotData['weight']);
    _height = castToType<double>(snapshotData['height']);
    _recordTime = snapshotData['recordTime'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('BMI')
          : FirebaseFirestore.instance.collectionGroup('BMI');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('BMI').doc(id);

  static Stream<BmiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BmiRecord.fromSnapshot(s));

  static Future<BmiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BmiRecord.fromSnapshot(s));

  static BmiRecord fromSnapshot(DocumentSnapshot snapshot) => BmiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BmiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BmiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BmiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BmiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBmiRecordData({
  double? weight,
  double? height,
  DateTime? recordTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'weight': weight,
      'height': height,
      'recordTime': recordTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class BmiRecordDocumentEquality implements Equality<BmiRecord> {
  const BmiRecordDocumentEquality();

  @override
  bool equals(BmiRecord? e1, BmiRecord? e2) {
    return e1?.weight == e2?.weight &&
        e1?.height == e2?.height &&
        e1?.recordTime == e2?.recordTime;
  }

  @override
  int hash(BmiRecord? e) =>
      const ListEquality().hash([e?.weight, e?.height, e?.recordTime]);

  @override
  bool isValidKey(Object? o) => o is BmiRecord;
}
