import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserBlockedRecord extends FirestoreRecord {
  UserBlockedRecord._(
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
          ? parent.collection('user_blocked')
          : FirebaseFirestore.instance.collectionGroup('user_blocked');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_blocked').doc();

  static Stream<UserBlockedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserBlockedRecord.fromSnapshot(s));

  static Future<UserBlockedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserBlockedRecord.fromSnapshot(s));

  static UserBlockedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserBlockedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserBlockedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserBlockedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserBlockedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserBlockedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserBlockedRecordData({
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserBlockedRecordDocumentEquality implements Equality<UserBlockedRecord> {
  const UserBlockedRecordDocumentEquality();

  @override
  bool equals(UserBlockedRecord? e1, UserBlockedRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        listEquality.equals(e1?.userData, e2?.userData);
  }

  @override
  int hash(UserBlockedRecord? e) =>
      const ListEquality().hash([e?.user, e?.userData]);

  @override
  bool isValidKey(Object? o) => o is UserBlockedRecord;
}
