import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_photo" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "num_comments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "num_votes" field.
  int? _numVotes;
  int get numVotes => _numVotes ?? 0;
  bool hasNumVotes() => _numVotes != null;

  // "post_userDisplayName" field.
  String? _postUserDisplayName;
  String get postUserDisplayName => _postUserDisplayName ?? '';
  bool hasPostUserDisplayName() => _postUserDisplayName != null;

  // "post_userAvatar" field.
  String? _postUserAvatar;
  String get postUserAvatar => _postUserAvatar ?? '';
  bool hasPostUserAvatar() => _postUserAvatar != null;

  // "post_visibilityState" field.
  String? _postVisibilityState;
  String get postVisibilityState => _postVisibilityState ?? '';
  bool hasPostVisibilityState() => _postVisibilityState != null;

  // "post_postedToUser" field.
  DocumentReference? _postPostedToUser;
  DocumentReference? get postPostedToUser => _postPostedToUser;
  bool hasPostPostedToUser() => _postPostedToUser != null;

  // "post_postedToUserDisplayName" field.
  String? _postPostedToUserDisplayName;
  String get postPostedToUserDisplayName => _postPostedToUserDisplayName ?? '';
  bool hasPostPostedToUserDisplayName() => _postPostedToUserDisplayName != null;

  // "post_type" field.
  String? _postType;
  String get postType => _postType ?? '';
  bool hasPostType() => _postType != null;

  void _initializeFields() {
    _postPhoto = snapshotData['post_photo'] as String?;
    _postTitle = snapshotData['post_title'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = castToType<int>(snapshotData['num_comments']);
    _numVotes = castToType<int>(snapshotData['num_votes']);
    _postUserDisplayName = snapshotData['post_userDisplayName'] as String?;
    _postUserAvatar = snapshotData['post_userAvatar'] as String?;
    _postVisibilityState = snapshotData['post_visibilityState'] as String?;
    _postPostedToUser = snapshotData['post_postedToUser'] as DocumentReference?;
    _postPostedToUserDisplayName =
        snapshotData['post_postedToUserDisplayName'] as String?;
    _postType = snapshotData['post_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  int? numVotes,
  String? postUserDisplayName,
  String? postUserAvatar,
  String? postVisibilityState,
  DocumentReference? postPostedToUser,
  String? postPostedToUserDisplayName,
  String? postType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_photo': postPhoto,
      'post_title': postTitle,
      'post_description': postDescription,
      'post_user': postUser,
      'time_posted': timePosted,
      'num_comments': numComments,
      'num_votes': numVotes,
      'post_userDisplayName': postUserDisplayName,
      'post_userAvatar': postUserAvatar,
      'post_visibilityState': postVisibilityState,
      'post_postedToUser': postPostedToUser,
      'post_postedToUserDisplayName': postPostedToUserDisplayName,
      'post_type': postType,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postPhoto == e2?.postPhoto &&
        e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numComments == e2?.numComments &&
        e1?.numVotes == e2?.numVotes &&
        e1?.postUserDisplayName == e2?.postUserDisplayName &&
        e1?.postUserAvatar == e2?.postUserAvatar &&
        e1?.postVisibilityState == e2?.postVisibilityState &&
        e1?.postPostedToUser == e2?.postPostedToUser &&
        e1?.postPostedToUserDisplayName == e2?.postPostedToUserDisplayName &&
        e1?.postType == e2?.postType;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.postPhoto,
        e?.postTitle,
        e?.postDescription,
        e?.postUser,
        e?.timePosted,
        e?.likes,
        e?.numComments,
        e?.numVotes,
        e?.postUserDisplayName,
        e?.postUserAvatar,
        e?.postVisibilityState,
        e?.postPostedToUser,
        e?.postPostedToUserDisplayName,
        e?.postType
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
