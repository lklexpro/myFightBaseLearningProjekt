import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BroadcastsRecord extends FirestoreRecord {
  BroadcastsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "creator_displayName" field.
  String? _creatorDisplayName;
  String get creatorDisplayName => _creatorDisplayName ?? '';
  bool hasCreatorDisplayName() => _creatorDisplayName != null;

  // "creator_avatar" field.
  String? _creatorAvatar;
  String get creatorAvatar => _creatorAvatar ?? '';
  bool hasCreatorAvatar() => _creatorAvatar != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "broadcast_headline" field.
  String? _broadcastHeadline;
  String get broadcastHeadline => _broadcastHeadline ?? '';
  bool hasBroadcastHeadline() => _broadcastHeadline != null;

  // "broadcast_message" field.
  String? _broadcastMessage;
  String get broadcastMessage => _broadcastMessage ?? '';
  bool hasBroadcastMessage() => _broadcastMessage != null;

  // "user_data" field.
  List<UserRelationDataStruct>? _userData;
  List<UserRelationDataStruct> get userData => _userData ?? const [];
  bool hasUserData() => _userData != null;

  // "user_readReceipts" field.
  List<DocumentReference>? _userReadReceipts;
  List<DocumentReference> get userReadReceipts => _userReadReceipts ?? const [];
  bool hasUserReadReceipts() => _userReadReceipts != null;

  void _initializeFields() {
    _creator = snapshotData['creator'] as DocumentReference?;
    _creatorDisplayName = snapshotData['creator_displayName'] as String?;
    _creatorAvatar = snapshotData['creator_avatar'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _broadcastHeadline = snapshotData['broadcast_headline'] as String?;
    _broadcastMessage = snapshotData['broadcast_message'] as String?;
    _userData = getStructList(
      snapshotData['user_data'],
      UserRelationDataStruct.fromMap,
    );
    _userReadReceipts = getDataList(snapshotData['user_readReceipts']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('broadcasts');

  static Stream<BroadcastsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BroadcastsRecord.fromSnapshot(s));

  static Future<BroadcastsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BroadcastsRecord.fromSnapshot(s));

  static BroadcastsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BroadcastsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BroadcastsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BroadcastsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BroadcastsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BroadcastsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBroadcastsRecordData({
  DocumentReference? creator,
  String? creatorDisplayName,
  String? creatorAvatar,
  DateTime? createdAt,
  String? uid,
  String? broadcastHeadline,
  String? broadcastMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creator': creator,
      'creator_displayName': creatorDisplayName,
      'creator_avatar': creatorAvatar,
      'createdAt': createdAt,
      'uid': uid,
      'broadcast_headline': broadcastHeadline,
      'broadcast_message': broadcastMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class BroadcastsRecordDocumentEquality implements Equality<BroadcastsRecord> {
  const BroadcastsRecordDocumentEquality();

  @override
  bool equals(BroadcastsRecord? e1, BroadcastsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.creator == e2?.creator &&
        e1?.creatorDisplayName == e2?.creatorDisplayName &&
        e1?.creatorAvatar == e2?.creatorAvatar &&
        e1?.createdAt == e2?.createdAt &&
        e1?.uid == e2?.uid &&
        e1?.broadcastHeadline == e2?.broadcastHeadline &&
        e1?.broadcastMessage == e2?.broadcastMessage &&
        listEquality.equals(e1?.userData, e2?.userData) &&
        listEquality.equals(e1?.userReadReceipts, e2?.userReadReceipts);
  }

  @override
  int hash(BroadcastsRecord? e) => const ListEquality().hash([
        e?.creator,
        e?.creatorDisplayName,
        e?.creatorAvatar,
        e?.createdAt,
        e?.uid,
        e?.broadcastHeadline,
        e?.broadcastMessage,
        e?.userData,
        e?.userReadReceipts
      ]);

  @override
  bool isValidKey(Object? o) => o is BroadcastsRecord;
}
