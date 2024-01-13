import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserNotificationInboxRecord extends FirestoreRecord {
  UserNotificationInboxRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "user_sender" field.
  DocumentReference? _userSender;
  DocumentReference? get userSender => _userSender;
  bool hasUserSender() => _userSender != null;

  // "user_senderID" field.
  String? _userSenderID;
  String get userSenderID => _userSenderID ?? '';
  bool hasUserSenderID() => _userSenderID != null;

  // "sender_displayName" field.
  String? _senderDisplayName;
  String get senderDisplayName => _senderDisplayName ?? '';
  bool hasSenderDisplayName() => _senderDisplayName != null;

  // "sender_avatar" field.
  String? _senderAvatar;
  String get senderAvatar => _senderAvatar ?? '';
  bool hasSenderAvatar() => _senderAvatar != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "requestType" field.
  String? _requestType;
  String get requestType => _requestType ?? '';
  bool hasRequestType() => _requestType != null;

  // "requestState" field.
  String? _requestState;
  String get requestState => _requestState ?? '';
  bool hasRequestState() => _requestState != null;

  // "requestHeadline" field.
  String? _requestHeadline;
  String get requestHeadline => _requestHeadline ?? '';
  bool hasRequestHeadline() => _requestHeadline != null;

  // "requestContent" field.
  String? _requestContent;
  String get requestContent => _requestContent ?? '';
  bool hasRequestContent() => _requestContent != null;

  // "requestImage" field.
  String? _requestImage;
  String get requestImage => _requestImage ?? '';
  bool hasRequestImage() => _requestImage != null;

  // "requestReferenceId" field.
  String? _requestReferenceId;
  String get requestReferenceId => _requestReferenceId ?? '';
  bool hasRequestReferenceId() => _requestReferenceId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _userSender = snapshotData['user_sender'] as DocumentReference?;
    _userSenderID = snapshotData['user_senderID'] as String?;
    _senderDisplayName = snapshotData['sender_displayName'] as String?;
    _senderAvatar = snapshotData['sender_avatar'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _requestType = snapshotData['requestType'] as String?;
    _requestState = snapshotData['requestState'] as String?;
    _requestHeadline = snapshotData['requestHeadline'] as String?;
    _requestContent = snapshotData['requestContent'] as String?;
    _requestImage = snapshotData['requestImage'] as String?;
    _requestReferenceId = snapshotData['requestReferenceId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_notificationInbox')
          : FirebaseFirestore.instance
              .collectionGroup('user_notificationInbox');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_notificationInbox').doc();

  static Stream<UserNotificationInboxRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => UserNotificationInboxRecord.fromSnapshot(s));

  static Future<UserNotificationInboxRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserNotificationInboxRecord.fromSnapshot(s));

  static UserNotificationInboxRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserNotificationInboxRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserNotificationInboxRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserNotificationInboxRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserNotificationInboxRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserNotificationInboxRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserNotificationInboxRecordData({
  DocumentReference? user,
  DocumentReference? userSender,
  String? userSenderID,
  String? senderDisplayName,
  String? senderAvatar,
  DateTime? createdAt,
  String? requestType,
  String? requestState,
  String? requestHeadline,
  String? requestContent,
  String? requestImage,
  String? requestReferenceId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'user_sender': userSender,
      'user_senderID': userSenderID,
      'sender_displayName': senderDisplayName,
      'sender_avatar': senderAvatar,
      'createdAt': createdAt,
      'requestType': requestType,
      'requestState': requestState,
      'requestHeadline': requestHeadline,
      'requestContent': requestContent,
      'requestImage': requestImage,
      'requestReferenceId': requestReferenceId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserNotificationInboxRecordDocumentEquality
    implements Equality<UserNotificationInboxRecord> {
  const UserNotificationInboxRecordDocumentEquality();

  @override
  bool equals(
      UserNotificationInboxRecord? e1, UserNotificationInboxRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.userSender == e2?.userSender &&
        e1?.userSenderID == e2?.userSenderID &&
        e1?.senderDisplayName == e2?.senderDisplayName &&
        e1?.senderAvatar == e2?.senderAvatar &&
        e1?.createdAt == e2?.createdAt &&
        e1?.requestType == e2?.requestType &&
        e1?.requestState == e2?.requestState &&
        e1?.requestHeadline == e2?.requestHeadline &&
        e1?.requestContent == e2?.requestContent &&
        e1?.requestImage == e2?.requestImage &&
        e1?.requestReferenceId == e2?.requestReferenceId;
  }

  @override
  int hash(UserNotificationInboxRecord? e) => const ListEquality().hash([
        e?.user,
        e?.userSender,
        e?.userSenderID,
        e?.senderDisplayName,
        e?.senderAvatar,
        e?.createdAt,
        e?.requestType,
        e?.requestState,
        e?.requestHeadline,
        e?.requestContent,
        e?.requestImage,
        e?.requestReferenceId
      ]);

  @override
  bool isValidKey(Object? o) => o is UserNotificationInboxRecord;
}
