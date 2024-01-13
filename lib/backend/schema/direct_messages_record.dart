import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DirectMessagesRecord extends FirestoreRecord {
  DirectMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "user_displayName" field.
  String? _userDisplayName;
  String get userDisplayName => _userDisplayName ?? '';
  bool hasUserDisplayName() => _userDisplayName != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "chatRef" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _userDisplayName = snapshotData['user_displayName'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _text = snapshotData['text'] as String?;
    _image = snapshotData['image'] as String?;
    _chatRef = snapshotData['chatRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('direct_messages')
          : FirebaseFirestore.instance.collectionGroup('direct_messages');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('direct_messages').doc();

  static Stream<DirectMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DirectMessagesRecord.fromSnapshot(s));

  static Future<DirectMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DirectMessagesRecord.fromSnapshot(s));

  static DirectMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DirectMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DirectMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DirectMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DirectMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DirectMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDirectMessagesRecordData({
  DocumentReference? user,
  String? userDisplayName,
  DateTime? timestamp,
  String? text,
  String? image,
  DocumentReference? chatRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'user_displayName': userDisplayName,
      'timestamp': timestamp,
      'text': text,
      'image': image,
      'chatRef': chatRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class DirectMessagesRecordDocumentEquality
    implements Equality<DirectMessagesRecord> {
  const DirectMessagesRecordDocumentEquality();

  @override
  bool equals(DirectMessagesRecord? e1, DirectMessagesRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.userDisplayName == e2?.userDisplayName &&
        e1?.timestamp == e2?.timestamp &&
        e1?.text == e2?.text &&
        e1?.image == e2?.image &&
        e1?.chatRef == e2?.chatRef;
  }

  @override
  int hash(DirectMessagesRecord? e) => const ListEquality().hash([
        e?.user,
        e?.userDisplayName,
        e?.timestamp,
        e?.text,
        e?.image,
        e?.chatRef
      ]);

  @override
  bool isValidKey(Object? o) => o is DirectMessagesRecord;
}
