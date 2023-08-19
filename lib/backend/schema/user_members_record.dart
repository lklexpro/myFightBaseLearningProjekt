import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserMembersRecord extends FirestoreRecord {
  UserMembersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "user_data" field.
  List<UserRelationDataStruct>? _userData;
  List<UserRelationDataStruct> get userData => _userData ?? const [];
  bool hasUserData() => _userData != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _userData = getStructList(
      snapshotData['user_data'],
      UserRelationDataStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_members')
          : FirebaseFirestore.instance.collectionGroup('user_members');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_members').doc();

  static Stream<UserMembersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserMembersRecord.fromSnapshot(s));

  static Future<UserMembersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserMembersRecord.fromSnapshot(s));

  static UserMembersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserMembersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserMembersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserMembersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserMembersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserMembersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserMembersRecordData({
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserMembersRecordDocumentEquality implements Equality<UserMembersRecord> {
  const UserMembersRecordDocumentEquality();

  @override
  bool equals(UserMembersRecord? e1, UserMembersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        listEquality.equals(e1?.userData, e2?.userData);
  }

  @override
  int hash(UserMembersRecord? e) =>
      const ListEquality().hash([e?.user, e?.userData]);

  @override
  bool isValidKey(Object? o) => o is UserMembersRecord;
}
