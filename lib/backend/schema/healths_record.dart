import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HealthsRecord extends FirestoreRecord {
  HealthsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sys" field.
  int? _sys;
  int get sys => _sys ?? 0;
  bool hasSys() => _sys != null;

  // "dia" field.
  int? _dia;
  int get dia => _dia ?? 0;
  bool hasDia() => _dia != null;

  // "pul" field.
  int? _pul;
  int get pul => _pul ?? 0;
  bool hasPul() => _pul != null;

  // "temperature" field.
  double? _temperature;
  double get temperature => _temperature ?? 0.0;
  bool hasTemperature() => _temperature != null;

  // "neck" field.
  bool? _neck;
  bool get neck => _neck ?? false;
  bool hasNeck() => _neck != null;

  // "nose" field.
  bool? _nose;
  bool get nose => _nose ?? false;
  bool hasNose() => _nose != null;

  // "record_user" field.
  DocumentReference? _recordUser;
  DocumentReference? get recordUser => _recordUser;
  bool hasRecordUser() => _recordUser != null;

  // "DateRecorded" field.
  DateTime? _dateRecorded;
  DateTime? get dateRecorded => _dateRecorded;
  bool hasDateRecorded() => _dateRecorded != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "days" field.
  String? _days;
  String get days => _days ?? '';
  bool hasDays() => _days != null;

  // "daysforinteger" field.
  int? _daysforinteger;
  int get daysforinteger => _daysforinteger ?? 0;
  bool hasDaysforinteger() => _daysforinteger != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _sys = castToType<int>(snapshotData['sys']);
    _dia = castToType<int>(snapshotData['dia']);
    _pul = castToType<int>(snapshotData['pul']);
    _temperature = castToType<double>(snapshotData['temperature']);
    _neck = snapshotData['neck'] as bool?;
    _nose = snapshotData['nose'] as bool?;
    _recordUser = snapshotData['record_user'] as DocumentReference?;
    _dateRecorded = snapshotData['DateRecorded'] as DateTime?;
    _height = castToType<double>(snapshotData['height']);
    _weight = castToType<double>(snapshotData['weight']);
    _days = snapshotData['days'] as String?;
    _daysforinteger = castToType<int>(snapshotData['daysforinteger']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Healths')
          : FirebaseFirestore.instance.collectionGroup('Healths');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Healths').doc(id);

  static Stream<HealthsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HealthsRecord.fromSnapshot(s));

  static Future<HealthsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HealthsRecord.fromSnapshot(s));

  static HealthsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HealthsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HealthsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HealthsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HealthsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HealthsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHealthsRecordData({
  int? sys,
  int? dia,
  int? pul,
  double? temperature,
  bool? neck,
  bool? nose,
  DocumentReference? recordUser,
  DateTime? dateRecorded,
  double? height,
  double? weight,
  String? days,
  int? daysforinteger,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sys': sys,
      'dia': dia,
      'pul': pul,
      'temperature': temperature,
      'neck': neck,
      'nose': nose,
      'record_user': recordUser,
      'DateRecorded': dateRecorded,
      'height': height,
      'weight': weight,
      'days': days,
      'daysforinteger': daysforinteger,
    }.withoutNulls,
  );

  return firestoreData;
}

class HealthsRecordDocumentEquality implements Equality<HealthsRecord> {
  const HealthsRecordDocumentEquality();

  @override
  bool equals(HealthsRecord? e1, HealthsRecord? e2) {
    return e1?.sys == e2?.sys &&
        e1?.dia == e2?.dia &&
        e1?.pul == e2?.pul &&
        e1?.temperature == e2?.temperature &&
        e1?.neck == e2?.neck &&
        e1?.nose == e2?.nose &&
        e1?.recordUser == e2?.recordUser &&
        e1?.dateRecorded == e2?.dateRecorded &&
        e1?.height == e2?.height &&
        e1?.weight == e2?.weight &&
        e1?.days == e2?.days &&
        e1?.daysforinteger == e2?.daysforinteger;
  }

  @override
  int hash(HealthsRecord? e) => const ListEquality().hash([
        e?.sys,
        e?.dia,
        e?.pul,
        e?.temperature,
        e?.neck,
        e?.nose,
        e?.recordUser,
        e?.dateRecorded,
        e?.height,
        e?.weight,
        e?.days,
        e?.daysforinteger
      ]);

  @override
  bool isValidKey(Object? o) => o is HealthsRecord;
}
