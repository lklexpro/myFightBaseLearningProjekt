import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InternalFeedbackMessagesRecord extends FirestoreRecord {
  InternalFeedbackMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "isAndroid" field.
  bool? _isAndroid;
  bool get isAndroid => _isAndroid ?? false;
  bool hasIsAndroid() => _isAndroid != null;

  // "isIOS" field.
  bool? _isIOS;
  bool get isIOS => _isIOS ?? false;
  bool hasIsIOS() => _isIOS != null;

  // "isWeb" field.
  bool? _isWeb;
  bool get isWeb => _isWeb ?? false;
  bool hasIsWeb() => _isWeb != null;

  // "reportPhotoUrl" field.
  String? _reportPhotoUrl;
  String get reportPhotoUrl => _reportPhotoUrl ?? '';
  bool hasReportPhotoUrl() => _reportPhotoUrl != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _isAndroid = snapshotData['isAndroid'] as bool?;
    _isIOS = snapshotData['isIOS'] as bool?;
    _isWeb = snapshotData['isWeb'] as bool?;
    _reportPhotoUrl = snapshotData['reportPhotoUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('internalFeedbackMessages');

  static Stream<InternalFeedbackMessagesRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => InternalFeedbackMessagesRecord.fromSnapshot(s));

  static Future<InternalFeedbackMessagesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InternalFeedbackMessagesRecord.fromSnapshot(s));

  static InternalFeedbackMessagesRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      InternalFeedbackMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InternalFeedbackMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InternalFeedbackMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InternalFeedbackMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InternalFeedbackMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInternalFeedbackMessagesRecordData({
  String? description,
  DateTime? timeCreated,
  DocumentReference? user,
  bool? isAndroid,
  bool? isIOS,
  bool? isWeb,
  String? reportPhotoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'time_created': timeCreated,
      'user': user,
      'isAndroid': isAndroid,
      'isIOS': isIOS,
      'isWeb': isWeb,
      'reportPhotoUrl': reportPhotoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class InternalFeedbackMessagesRecordDocumentEquality
    implements Equality<InternalFeedbackMessagesRecord> {
  const InternalFeedbackMessagesRecordDocumentEquality();

  @override
  bool equals(
      InternalFeedbackMessagesRecord? e1, InternalFeedbackMessagesRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.user == e2?.user &&
        e1?.isAndroid == e2?.isAndroid &&
        e1?.isIOS == e2?.isIOS &&
        e1?.isWeb == e2?.isWeb &&
        e1?.reportPhotoUrl == e2?.reportPhotoUrl;
  }

  @override
  int hash(InternalFeedbackMessagesRecord? e) => const ListEquality().hash([
        e?.description,
        e?.timeCreated,
        e?.user,
        e?.isAndroid,
        e?.isIOS,
        e?.isWeb,
        e?.reportPhotoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is InternalFeedbackMessagesRecord;
}
