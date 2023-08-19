import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRequestsReceivedRecord extends FirestoreRecord {
  UserRequestsReceivedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "user_requestReceived" field.
  List<DocumentReference>? _userRequestReceived;
  List<DocumentReference> get userRequestReceived =>
      _userRequestReceived ?? const [];
  bool hasUserRequestReceived() => _userRequestReceived != null;

  // "requestData" field.
  List<UserRequestStruct>? _requestData;
  List<UserRequestStruct> get requestData => _requestData ?? const [];
  bool hasRequestData() => _requestData != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _userRequestReceived = getDataList(snapshotData['user_requestReceived']);
    _requestData = getStructList(
      snapshotData['requestData'],
      UserRequestStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_requestsReceived')
          : FirebaseFirestore.instance.collectionGroup('user_requestsReceived');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_requestsReceived').doc();

  static Stream<UserRequestsReceivedRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => UserRequestsReceivedRecord.fromSnapshot(s));

  static Future<UserRequestsReceivedRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserRequestsReceivedRecord.fromSnapshot(s));

  static UserRequestsReceivedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserRequestsReceivedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRequestsReceivedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRequestsReceivedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRequestsReceivedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRequestsReceivedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRequestsReceivedRecordData({
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRequestsReceivedRecordDocumentEquality
    implements Equality<UserRequestsReceivedRecord> {
  const UserRequestsReceivedRecordDocumentEquality();

  @override
  bool equals(UserRequestsReceivedRecord? e1, UserRequestsReceivedRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        listEquality.equals(e1?.userRequestReceived, e2?.userRequestReceived) &&
        listEquality.equals(e1?.requestData, e2?.requestData);
  }

  @override
  int hash(UserRequestsReceivedRecord? e) => const ListEquality()
      .hash([e?.user, e?.userRequestReceived, e?.requestData]);

  @override
  bool isValidKey(Object? o) => o is UserRequestsReceivedRecord;
}
