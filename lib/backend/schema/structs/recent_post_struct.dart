// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecentPostStruct extends FFFirebaseStruct {
  RecentPostStruct({
    DocumentReference? postID,
    DateTime? timePosted,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _postID = postID,
        _timePosted = timePosted,
        super(firestoreUtilData);

  // "postID" field.
  DocumentReference? _postID;
  DocumentReference? get postID => _postID;
  set postID(DocumentReference? val) => _postID = val;
  bool hasPostID() => _postID != null;

  // "timePosted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  set timePosted(DateTime? val) => _timePosted = val;
  bool hasTimePosted() => _timePosted != null;

  static RecentPostStruct fromMap(Map<String, dynamic> data) =>
      RecentPostStruct(
        postID: data['postID'] as DocumentReference?,
        timePosted: data['timePosted'] as DateTime?,
      );

  static RecentPostStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? RecentPostStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'postID': _postID,
        'timePosted': _timePosted,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'postID': serializeParam(
          _postID,
          ParamType.DocumentReference,
        ),
        'timePosted': serializeParam(
          _timePosted,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static RecentPostStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecentPostStruct(
        postID: deserializeParam(
          data['postID'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['posts'],
        ),
        timePosted: deserializeParam(
          data['timePosted'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'RecentPostStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecentPostStruct &&
        postID == other.postID &&
        timePosted == other.timePosted;
  }

  @override
  int get hashCode => const ListEquality().hash([postID, timePosted]);
}

RecentPostStruct createRecentPostStruct({
  DocumentReference? postID,
  DateTime? timePosted,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecentPostStruct(
      postID: postID,
      timePosted: timePosted,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecentPostStruct? updateRecentPostStruct(
  RecentPostStruct? recentPost, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recentPost
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecentPostStructData(
  Map<String, dynamic> firestoreData,
  RecentPostStruct? recentPost,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recentPost == null) {
    return;
  }
  if (recentPost.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recentPost.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recentPostData = getRecentPostFirestoreData(recentPost, forFieldValue);
  final nestedData = recentPostData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = recentPost.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecentPostFirestoreData(
  RecentPostStruct? recentPost, [
  bool forFieldValue = false,
]) {
  if (recentPost == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recentPost.toMap());

  // Add any Firestore field values
  recentPost.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecentPostListFirestoreData(
  List<RecentPostStruct>? recentPosts,
) =>
    recentPosts?.map((e) => getRecentPostFirestoreData(e, true)).toList() ?? [];
