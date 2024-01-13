import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsCommentsRecord extends FirestoreRecord {
  PostsCommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment_user" field.
  DocumentReference? _commentUser;
  DocumentReference? get commentUser => _commentUser;
  bool hasCommentUser() => _commentUser != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "comment_description" field.
  String? _commentDescription;
  String get commentDescription => _commentDescription ?? '';
  bool hasCommentDescription() => _commentDescription != null;

  // "comment_user_name" field.
  String? _commentUserName;
  String get commentUserName => _commentUserName ?? '';
  bool hasCommentUserName() => _commentUserName != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _commentUser = snapshotData['comment_user'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _commentDescription = snapshotData['comment_description'] as String?;
    _commentUserName = snapshotData['comment_user_name'] as String?;
    _likes = getDataList(snapshotData['likes']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('posts_comments')
          : FirebaseFirestore.instance.collectionGroup('posts_comments');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('posts_comments').doc();

  static Stream<PostsCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsCommentsRecord.fromSnapshot(s));

  static Future<PostsCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsCommentsRecord.fromSnapshot(s));

  static PostsCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostsCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsCommentsRecordData({
  DocumentReference? commentUser,
  DateTime? timePosted,
  String? commentDescription,
  String? commentUserName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment_user': commentUser,
      'time_posted': timePosted,
      'comment_description': commentDescription,
      'comment_user_name': commentUserName,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsCommentsRecordDocumentEquality
    implements Equality<PostsCommentsRecord> {
  const PostsCommentsRecordDocumentEquality();

  @override
  bool equals(PostsCommentsRecord? e1, PostsCommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.commentUser == e2?.commentUser &&
        e1?.timePosted == e2?.timePosted &&
        e1?.commentDescription == e2?.commentDescription &&
        e1?.commentUserName == e2?.commentUserName &&
        listEquality.equals(e1?.likes, e2?.likes);
  }

  @override
  int hash(PostsCommentsRecord? e) => const ListEquality().hash([
        e?.commentUser,
        e?.timePosted,
        e?.commentDescription,
        e?.commentUserName,
        e?.likes
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsCommentsRecord;
}
