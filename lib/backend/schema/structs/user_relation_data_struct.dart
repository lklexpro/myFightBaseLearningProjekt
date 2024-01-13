// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRelationDataStruct extends FFFirebaseStruct {
  UserRelationDataStruct({
    String? userID,
    DocumentReference? userDocRef,
    String? userDisplayName,
    String? userAvatar,
    DateTime? relationCreatedAt,
    String? relationType,
    String? relationStatus,
    List<String>? relationLabels,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userID = userID,
        _userDocRef = userDocRef,
        _userDisplayName = userDisplayName,
        _userAvatar = userAvatar,
        _relationCreatedAt = relationCreatedAt,
        _relationType = relationType,
        _relationStatus = relationStatus,
        _relationLabels = relationLabels,
        super(firestoreUtilData);

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  set userID(String? val) => _userID = val;
  bool hasUserID() => _userID != null;

  // "userDocRef" field.
  DocumentReference? _userDocRef;
  DocumentReference? get userDocRef => _userDocRef;
  set userDocRef(DocumentReference? val) => _userDocRef = val;
  bool hasUserDocRef() => _userDocRef != null;

  // "userDisplayName" field.
  String? _userDisplayName;
  String get userDisplayName => _userDisplayName ?? '';
  set userDisplayName(String? val) => _userDisplayName = val;
  bool hasUserDisplayName() => _userDisplayName != null;

  // "userAvatar" field.
  String? _userAvatar;
  String get userAvatar => _userAvatar ?? '';
  set userAvatar(String? val) => _userAvatar = val;
  bool hasUserAvatar() => _userAvatar != null;

  // "relationCreatedAt" field.
  DateTime? _relationCreatedAt;
  DateTime? get relationCreatedAt => _relationCreatedAt;
  set relationCreatedAt(DateTime? val) => _relationCreatedAt = val;
  bool hasRelationCreatedAt() => _relationCreatedAt != null;

  // "relationType" field.
  String? _relationType;
  String get relationType => _relationType ?? '';
  set relationType(String? val) => _relationType = val;
  bool hasRelationType() => _relationType != null;

  // "relationStatus" field.
  String? _relationStatus;
  String get relationStatus => _relationStatus ?? '';
  set relationStatus(String? val) => _relationStatus = val;
  bool hasRelationStatus() => _relationStatus != null;

  // "relationLabels" field.
  List<String>? _relationLabels;
  List<String> get relationLabels => _relationLabels ?? const [];
  set relationLabels(List<String>? val) => _relationLabels = val;
  void updateRelationLabels(Function(List<String>) updateFn) =>
      updateFn(_relationLabels ??= []);
  bool hasRelationLabels() => _relationLabels != null;

  static UserRelationDataStruct fromMap(Map<String, dynamic> data) =>
      UserRelationDataStruct(
        userID: data['userID'] as String?,
        userDocRef: data['userDocRef'] as DocumentReference?,
        userDisplayName: data['userDisplayName'] as String?,
        userAvatar: data['userAvatar'] as String?,
        relationCreatedAt: data['relationCreatedAt'] as DateTime?,
        relationType: data['relationType'] as String?,
        relationStatus: data['relationStatus'] as String?,
        relationLabels: getDataList(data['relationLabels']),
      );

  static UserRelationDataStruct? maybeFromMap(dynamic data) => data is Map
      ? UserRelationDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userID': _userID,
        'userDocRef': _userDocRef,
        'userDisplayName': _userDisplayName,
        'userAvatar': _userAvatar,
        'relationCreatedAt': _relationCreatedAt,
        'relationType': _relationType,
        'relationStatus': _relationStatus,
        'relationLabels': _relationLabels,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userID': serializeParam(
          _userID,
          ParamType.String,
        ),
        'userDocRef': serializeParam(
          _userDocRef,
          ParamType.DocumentReference,
        ),
        'userDisplayName': serializeParam(
          _userDisplayName,
          ParamType.String,
        ),
        'userAvatar': serializeParam(
          _userAvatar,
          ParamType.String,
        ),
        'relationCreatedAt': serializeParam(
          _relationCreatedAt,
          ParamType.DateTime,
        ),
        'relationType': serializeParam(
          _relationType,
          ParamType.String,
        ),
        'relationStatus': serializeParam(
          _relationStatus,
          ParamType.String,
        ),
        'relationLabels': serializeParam(
          _relationLabels,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static UserRelationDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserRelationDataStruct(
        userID: deserializeParam(
          data['userID'],
          ParamType.String,
          false,
        ),
        userDocRef: deserializeParam(
          data['userDocRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['all_users'],
        ),
        userDisplayName: deserializeParam(
          data['userDisplayName'],
          ParamType.String,
          false,
        ),
        userAvatar: deserializeParam(
          data['userAvatar'],
          ParamType.String,
          false,
        ),
        relationCreatedAt: deserializeParam(
          data['relationCreatedAt'],
          ParamType.DateTime,
          false,
        ),
        relationType: deserializeParam(
          data['relationType'],
          ParamType.String,
          false,
        ),
        relationStatus: deserializeParam(
          data['relationStatus'],
          ParamType.String,
          false,
        ),
        relationLabels: deserializeParam<String>(
          data['relationLabels'],
          ParamType.String,
          true,
        ),
      );

  static UserRelationDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserRelationDataStruct(
        userID: convertAlgoliaParam(
          data['userID'],
          ParamType.String,
          false,
        ),
        userDocRef: convertAlgoliaParam(
          data['userDocRef'],
          ParamType.DocumentReference,
          false,
        ),
        userDisplayName: convertAlgoliaParam(
          data['userDisplayName'],
          ParamType.String,
          false,
        ),
        userAvatar: convertAlgoliaParam(
          data['userAvatar'],
          ParamType.String,
          false,
        ),
        relationCreatedAt: convertAlgoliaParam(
          data['relationCreatedAt'],
          ParamType.DateTime,
          false,
        ),
        relationType: convertAlgoliaParam(
          data['relationType'],
          ParamType.String,
          false,
        ),
        relationStatus: convertAlgoliaParam(
          data['relationStatus'],
          ParamType.String,
          false,
        ),
        relationLabels: convertAlgoliaParam<String>(
          data['relationLabels'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserRelationDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserRelationDataStruct &&
        userID == other.userID &&
        userDocRef == other.userDocRef &&
        userDisplayName == other.userDisplayName &&
        userAvatar == other.userAvatar &&
        relationCreatedAt == other.relationCreatedAt &&
        relationType == other.relationType &&
        relationStatus == other.relationStatus &&
        listEquality.equals(relationLabels, other.relationLabels);
  }

  @override
  int get hashCode => const ListEquality().hash([
        userID,
        userDocRef,
        userDisplayName,
        userAvatar,
        relationCreatedAt,
        relationType,
        relationStatus,
        relationLabels
      ]);
}

UserRelationDataStruct createUserRelationDataStruct({
  String? userID,
  DocumentReference? userDocRef,
  String? userDisplayName,
  String? userAvatar,
  DateTime? relationCreatedAt,
  String? relationType,
  String? relationStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserRelationDataStruct(
      userID: userID,
      userDocRef: userDocRef,
      userDisplayName: userDisplayName,
      userAvatar: userAvatar,
      relationCreatedAt: relationCreatedAt,
      relationType: relationType,
      relationStatus: relationStatus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserRelationDataStruct? updateUserRelationDataStruct(
  UserRelationDataStruct? userRelationData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userRelationData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserRelationDataStructData(
  Map<String, dynamic> firestoreData,
  UserRelationDataStruct? userRelationData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userRelationData == null) {
    return;
  }
  if (userRelationData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userRelationData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userRelationDataData =
      getUserRelationDataFirestoreData(userRelationData, forFieldValue);
  final nestedData =
      userRelationDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userRelationData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserRelationDataFirestoreData(
  UserRelationDataStruct? userRelationData, [
  bool forFieldValue = false,
]) {
  if (userRelationData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userRelationData.toMap());

  // Add any Firestore field values
  userRelationData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserRelationDataListFirestoreData(
  List<UserRelationDataStruct>? userRelationDatas,
) =>
    userRelationDatas
        ?.map((e) => getUserRelationDataFirestoreData(e, true))
        .toList() ??
    [];
