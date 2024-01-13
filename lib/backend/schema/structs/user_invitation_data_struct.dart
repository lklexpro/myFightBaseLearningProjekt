// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInvitationDataStruct extends FFFirebaseStruct {
  UserInvitationDataStruct({
    DocumentReference? user,
    String? userID,
    String? userDisplayName,
    String? userAvatar,
    bool? userIsInvited,
    DateTime? invitationSentAt,
    String? userInvitationResponse,
    DateTime? userInvitationResponseSentAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _userID = userID,
        _userDisplayName = userDisplayName,
        _userAvatar = userAvatar,
        _userIsInvited = userIsInvited,
        _invitationSentAt = invitationSentAt,
        _userInvitationResponse = userInvitationResponse,
        _userInvitationResponseSentAt = userInvitationResponseSentAt,
        super(firestoreUtilData);

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;
  bool hasUser() => _user != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  set userID(String? val) => _userID = val;
  bool hasUserID() => _userID != null;

  // "user_displayName" field.
  String? _userDisplayName;
  String get userDisplayName => _userDisplayName ?? '';
  set userDisplayName(String? val) => _userDisplayName = val;
  bool hasUserDisplayName() => _userDisplayName != null;

  // "user_avatar" field.
  String? _userAvatar;
  String get userAvatar => _userAvatar ?? '';
  set userAvatar(String? val) => _userAvatar = val;
  bool hasUserAvatar() => _userAvatar != null;

  // "user_isInvited" field.
  bool? _userIsInvited;
  bool get userIsInvited => _userIsInvited ?? false;
  set userIsInvited(bool? val) => _userIsInvited = val;
  bool hasUserIsInvited() => _userIsInvited != null;

  // "invitationSentAt" field.
  DateTime? _invitationSentAt;
  DateTime? get invitationSentAt => _invitationSentAt;
  set invitationSentAt(DateTime? val) => _invitationSentAt = val;
  bool hasInvitationSentAt() => _invitationSentAt != null;

  // "user_invitationResponse" field.
  String? _userInvitationResponse;
  String get userInvitationResponse => _userInvitationResponse ?? '';
  set userInvitationResponse(String? val) => _userInvitationResponse = val;
  bool hasUserInvitationResponse() => _userInvitationResponse != null;

  // "user_invitationResponseSentAt" field.
  DateTime? _userInvitationResponseSentAt;
  DateTime? get userInvitationResponseSentAt => _userInvitationResponseSentAt;
  set userInvitationResponseSentAt(DateTime? val) =>
      _userInvitationResponseSentAt = val;
  bool hasUserInvitationResponseSentAt() =>
      _userInvitationResponseSentAt != null;

  static UserInvitationDataStruct fromMap(Map<String, dynamic> data) =>
      UserInvitationDataStruct(
        user: data['user'] as DocumentReference?,
        userID: data['userID'] as String?,
        userDisplayName: data['user_displayName'] as String?,
        userAvatar: data['user_avatar'] as String?,
        userIsInvited: data['user_isInvited'] as bool?,
        invitationSentAt: data['invitationSentAt'] as DateTime?,
        userInvitationResponse: data['user_invitationResponse'] as String?,
        userInvitationResponseSentAt:
            data['user_invitationResponseSentAt'] as DateTime?,
      );

  static UserInvitationDataStruct? maybeFromMap(dynamic data) => data is Map
      ? UserInvitationDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'userID': _userID,
        'user_displayName': _userDisplayName,
        'user_avatar': _userAvatar,
        'user_isInvited': _userIsInvited,
        'invitationSentAt': _invitationSentAt,
        'user_invitationResponse': _userInvitationResponse,
        'user_invitationResponseSentAt': _userInvitationResponseSentAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'userID': serializeParam(
          _userID,
          ParamType.String,
        ),
        'user_displayName': serializeParam(
          _userDisplayName,
          ParamType.String,
        ),
        'user_avatar': serializeParam(
          _userAvatar,
          ParamType.String,
        ),
        'user_isInvited': serializeParam(
          _userIsInvited,
          ParamType.bool,
        ),
        'invitationSentAt': serializeParam(
          _invitationSentAt,
          ParamType.DateTime,
        ),
        'user_invitationResponse': serializeParam(
          _userInvitationResponse,
          ParamType.String,
        ),
        'user_invitationResponseSentAt': serializeParam(
          _userInvitationResponseSentAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static UserInvitationDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserInvitationDataStruct(
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['all_users'],
        ),
        userID: deserializeParam(
          data['userID'],
          ParamType.String,
          false,
        ),
        userDisplayName: deserializeParam(
          data['user_displayName'],
          ParamType.String,
          false,
        ),
        userAvatar: deserializeParam(
          data['user_avatar'],
          ParamType.String,
          false,
        ),
        userIsInvited: deserializeParam(
          data['user_isInvited'],
          ParamType.bool,
          false,
        ),
        invitationSentAt: deserializeParam(
          data['invitationSentAt'],
          ParamType.DateTime,
          false,
        ),
        userInvitationResponse: deserializeParam(
          data['user_invitationResponse'],
          ParamType.String,
          false,
        ),
        userInvitationResponseSentAt: deserializeParam(
          data['user_invitationResponseSentAt'],
          ParamType.DateTime,
          false,
        ),
      );

  static UserInvitationDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserInvitationDataStruct(
        user: convertAlgoliaParam(
          data['user'],
          ParamType.DocumentReference,
          false,
        ),
        userID: convertAlgoliaParam(
          data['userID'],
          ParamType.String,
          false,
        ),
        userDisplayName: convertAlgoliaParam(
          data['user_displayName'],
          ParamType.String,
          false,
        ),
        userAvatar: convertAlgoliaParam(
          data['user_avatar'],
          ParamType.String,
          false,
        ),
        userIsInvited: convertAlgoliaParam(
          data['user_isInvited'],
          ParamType.bool,
          false,
        ),
        invitationSentAt: convertAlgoliaParam(
          data['invitationSentAt'],
          ParamType.DateTime,
          false,
        ),
        userInvitationResponse: convertAlgoliaParam(
          data['user_invitationResponse'],
          ParamType.String,
          false,
        ),
        userInvitationResponseSentAt: convertAlgoliaParam(
          data['user_invitationResponseSentAt'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserInvitationDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserInvitationDataStruct &&
        user == other.user &&
        userID == other.userID &&
        userDisplayName == other.userDisplayName &&
        userAvatar == other.userAvatar &&
        userIsInvited == other.userIsInvited &&
        invitationSentAt == other.invitationSentAt &&
        userInvitationResponse == other.userInvitationResponse &&
        userInvitationResponseSentAt == other.userInvitationResponseSentAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        user,
        userID,
        userDisplayName,
        userAvatar,
        userIsInvited,
        invitationSentAt,
        userInvitationResponse,
        userInvitationResponseSentAt
      ]);
}

UserInvitationDataStruct createUserInvitationDataStruct({
  DocumentReference? user,
  String? userID,
  String? userDisplayName,
  String? userAvatar,
  bool? userIsInvited,
  DateTime? invitationSentAt,
  String? userInvitationResponse,
  DateTime? userInvitationResponseSentAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserInvitationDataStruct(
      user: user,
      userID: userID,
      userDisplayName: userDisplayName,
      userAvatar: userAvatar,
      userIsInvited: userIsInvited,
      invitationSentAt: invitationSentAt,
      userInvitationResponse: userInvitationResponse,
      userInvitationResponseSentAt: userInvitationResponseSentAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserInvitationDataStruct? updateUserInvitationDataStruct(
  UserInvitationDataStruct? userInvitationData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userInvitationData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserInvitationDataStructData(
  Map<String, dynamic> firestoreData,
  UserInvitationDataStruct? userInvitationData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userInvitationData == null) {
    return;
  }
  if (userInvitationData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userInvitationData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userInvitationDataData =
      getUserInvitationDataFirestoreData(userInvitationData, forFieldValue);
  final nestedData =
      userInvitationDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userInvitationData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserInvitationDataFirestoreData(
  UserInvitationDataStruct? userInvitationData, [
  bool forFieldValue = false,
]) {
  if (userInvitationData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userInvitationData.toMap());

  // Add any Firestore field values
  userInvitationData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserInvitationDataListFirestoreData(
  List<UserInvitationDataStruct>? userInvitationDatas,
) =>
    userInvitationDatas
        ?.map((e) => getUserInvitationDataFirestoreData(e, true))
        .toList() ??
    [];
