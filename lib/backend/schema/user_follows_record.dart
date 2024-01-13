import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserFollowsRecord extends FirestoreRecord {
  UserFollowsRecord._(
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
          ? parent.collection('user_follows')
          : FirebaseFirestore.instance.collectionGroup('user_follows');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_follows').doc();

  static Stream<UserFollowsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserFollowsRecord.fromSnapshot(s));

  static Future<UserFollowsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserFollowsRecord.fromSnapshot(s));

  static UserFollowsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserFollowsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserFollowsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserFollowsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserFollowsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserFollowsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserFollowsRecordData({
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserFollowsRecordDocumentEquality implements Equality<UserFollowsRecord> {
  const UserFollowsRecordDocumentEquality();

  @override
  bool equals(UserFollowsRecord? e1, UserFollowsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        listEquality.equals(e1?.userData, e2?.userData);
  }

  @override
  int hash(UserFollowsRecord? e) =>
      const ListEquality().hash([e?.user, e?.userData]);

  @override
  bool isValidKey(Object? o) => o is UserFollowsRecord;
}
