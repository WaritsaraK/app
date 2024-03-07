import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationsRecord extends FirestoreRecord {
  MedicationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "uploadtime" field.
  DateTime? _uploadtime;
  DateTime? get uploadtime => _uploadtime;
  bool hasUploadtime() => _uploadtime != null;

  // "image_drug" field.
  List<String>? _imageDrug;
  List<String> get imageDrug => _imageDrug ?? const [];
  bool hasImageDrug() => _imageDrug != null;

  // "name_drug" field.
  String? _nameDrug;
  String get nameDrug => _nameDrug ?? '';
  bool hasNameDrug() => _nameDrug != null;

  // "detail_drug" field.
  String? _detailDrug;
  String get detailDrug => _detailDrug ?? '';
  bool hasDetailDrug() => _detailDrug != null;

  // "type_drug" field.
  String? _typeDrug;
  String get typeDrug => _typeDrug ?? '';
  bool hasTypeDrug() => _typeDrug != null;

  // "dosage" field.
  int? _dosage;
  int get dosage => _dosage ?? 0;
  bool hasDosage() => _dosage != null;

  // "take_drug" field.
  String? _takeDrug;
  String get takeDrug => _takeDrug ?? '';
  bool hasTakeDrug() => _takeDrug != null;

  // "use_drug" field.
  String? _useDrug;
  String get useDrug => _useDrug ?? '';
  bool hasUseDrug() => _useDrug != null;

  // "morning" field.
  bool? _morning;
  bool get morning => _morning ?? false;
  bool hasMorning() => _morning != null;

  // "morningTime" field.
  DateTime? _morningTime;
  DateTime? get morningTime => _morningTime;
  bool hasMorningTime() => _morningTime != null;

  // "noon" field.
  bool? _noon;
  bool get noon => _noon ?? false;
  bool hasNoon() => _noon != null;

  // "noonTime" field.
  DateTime? _noonTime;
  DateTime? get noonTime => _noonTime;
  bool hasNoonTime() => _noonTime != null;

  // "evening" field.
  bool? _evening;
  bool get evening => _evening ?? false;
  bool hasEvening() => _evening != null;

  // "eveningTime" field.
  DateTime? _eveningTime;
  DateTime? get eveningTime => _eveningTime;
  bool hasEveningTime() => _eveningTime != null;

  // "night" field.
  bool? _night;
  bool get night => _night ?? false;
  bool hasNight() => _night != null;

  // "nightTime" field.
  DateTime? _nightTime;
  DateTime? get nightTime => _nightTime;
  bool hasNightTime() => _nightTime != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "end" field.
  bool? _end;
  bool get end => _end ?? false;
  bool hasEnd() => _end != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _uploadtime = snapshotData['uploadtime'] as DateTime?;
    _imageDrug = getDataList(snapshotData['image_drug']);
    _nameDrug = snapshotData['name_drug'] as String?;
    _detailDrug = snapshotData['detail_drug'] as String?;
    _typeDrug = snapshotData['type_drug'] as String?;
    _dosage = castToType<int>(snapshotData['dosage']);
    _takeDrug = snapshotData['take_drug'] as String?;
    _useDrug = snapshotData['use_drug'] as String?;
    _morning = snapshotData['morning'] as bool?;
    _morningTime = snapshotData['morningTime'] as DateTime?;
    _noon = snapshotData['noon'] as bool?;
    _noonTime = snapshotData['noonTime'] as DateTime?;
    _evening = snapshotData['evening'] as bool?;
    _eveningTime = snapshotData['eveningTime'] as DateTime?;
    _night = snapshotData['night'] as bool?;
    _nightTime = snapshotData['nightTime'] as DateTime?;
    _id = snapshotData['id'] as String?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _end = snapshotData['end'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('medications')
          : FirebaseFirestore.instance.collectionGroup('medications');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('medications').doc(id);

  static Stream<MedicationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicationsRecord.fromSnapshot(s));

  static Future<MedicationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicationsRecord.fromSnapshot(s));

  static MedicationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicationsRecordData({
  DocumentReference? user,
  DateTime? uploadtime,
  String? nameDrug,
  String? detailDrug,
  String? typeDrug,
  int? dosage,
  String? takeDrug,
  String? useDrug,
  bool? morning,
  DateTime? morningTime,
  bool? noon,
  DateTime? noonTime,
  bool? evening,
  DateTime? eveningTime,
  bool? night,
  DateTime? nightTime,
  String? id,
  DateTime? endTime,
  bool? end,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'uploadtime': uploadtime,
      'name_drug': nameDrug,
      'detail_drug': detailDrug,
      'type_drug': typeDrug,
      'dosage': dosage,
      'take_drug': takeDrug,
      'use_drug': useDrug,
      'morning': morning,
      'morningTime': morningTime,
      'noon': noon,
      'noonTime': noonTime,
      'evening': evening,
      'eveningTime': eveningTime,
      'night': night,
      'nightTime': nightTime,
      'id': id,
      'endTime': endTime,
      'end': end,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicationsRecordDocumentEquality implements Equality<MedicationsRecord> {
  const MedicationsRecordDocumentEquality();

  @override
  bool equals(MedicationsRecord? e1, MedicationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.uploadtime == e2?.uploadtime &&
        listEquality.equals(e1?.imageDrug, e2?.imageDrug) &&
        e1?.nameDrug == e2?.nameDrug &&
        e1?.detailDrug == e2?.detailDrug &&
        e1?.typeDrug == e2?.typeDrug &&
        e1?.dosage == e2?.dosage &&
        e1?.takeDrug == e2?.takeDrug &&
        e1?.useDrug == e2?.useDrug &&
        e1?.morning == e2?.morning &&
        e1?.morningTime == e2?.morningTime &&
        e1?.noon == e2?.noon &&
        e1?.noonTime == e2?.noonTime &&
        e1?.evening == e2?.evening &&
        e1?.eveningTime == e2?.eveningTime &&
        e1?.night == e2?.night &&
        e1?.nightTime == e2?.nightTime &&
        e1?.id == e2?.id &&
        e1?.endTime == e2?.endTime &&
        e1?.end == e2?.end;
  }

  @override
  int hash(MedicationsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.uploadtime,
        e?.imageDrug,
        e?.nameDrug,
        e?.detailDrug,
        e?.typeDrug,
        e?.dosage,
        e?.takeDrug,
        e?.useDrug,
        e?.morning,
        e?.morningTime,
        e?.noon,
        e?.noonTime,
        e?.evening,
        e?.eveningTime,
        e?.night,
        e?.nightTime,
        e?.id,
        e?.endTime,
        e?.end
      ]);

  @override
  bool isValidKey(Object? o) => o is MedicationsRecord;
}
