// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParticipatingUserStruct extends FFFirebaseStruct {
  ParticipatingUserStruct({
    DocumentReference? user,
    String? userID,
    String? userDisplayName,
    String? userAvatar,
    bool? userIsInvited,
    bool? userIsParticipating,
    DateTime? userInvitationAcceptedAt,
    DateTime? userParticipationSentAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _userID = userID,
        _userDisplayName = userDisplayName,
        _userAvatar = userAvatar,
        _userIsInvited = userIsInvited,
        _userIsParticipating = userIsParticipating,
        _userInvitationAcceptedAt = userInvitationAcceptedAt,
        _userParticipationSentAt = userParticipationSentAt,
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

  // "user_isParticipating" field.
  bool? _userIsParticipating;
  bool get userIsParticipating => _userIsParticipating ?? false;
  set userIsParticipating(bool? val) => _userIsParticipating = val;
  bool hasUserIsParticipating() => _userIsParticipating != null;

  // "user_invitationAcceptedAt" field.
  DateTime? _userInvitationAcceptedAt;
  DateTime? get userInvitationAcceptedAt => _userInvitationAcceptedAt;
  set userInvitationAcceptedAt(DateTime? val) =>
      _userInvitationAcceptedAt = val;
  bool hasUserInvitationAcceptedAt() => _userInvitationAcceptedAt != null;

  // "user_participationSentAt" field.
  DateTime? _userParticipationSentAt;
  DateTime? get userParticipationSentAt => _userParticipationSentAt;
  set userParticipationSentAt(DateTime? val) => _userParticipationSentAt = val;
  bool hasUserParticipationSentAt() => _userParticipationSentAt != null;

  static ParticipatingUserStruct fromMap(Map<String, dynamic> data) =>
      ParticipatingUserStruct(
        user: data['user'] as DocumentReference?,
        userID: data['userID'] as String?,
        userDisplayName: data['user_displayName'] as String?,
        userAvatar: data['user_avatar'] as String?,
        userIsInvited: data['user_isInvited'] as bool?,
        userIsParticipating: data['user_isParticipating'] as bool?,
        userInvitationAcceptedAt:
            data['user_invitationAcceptedAt'] as DateTime?,
        userParticipationSentAt: data['user_participationSentAt'] as DateTime?,
      );

  static ParticipatingUserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? ParticipatingUserStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'userID': _userID,
        'user_displayName': _userDisplayName,
        'user_avatar': _userAvatar,
        'user_isInvited': _userIsInvited,
        'user_isParticipating': _userIsParticipating,
        'user_invitationAcceptedAt': _userInvitationAcceptedAt,
        'user_participationSentAt': _userParticipationSentAt,
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
        'user_isParticipating': serializeParam(
          _userIsParticipating,
          ParamType.bool,
        ),
        'user_invitationAcceptedAt': serializeParam(
          _userInvitationAcceptedAt,
          ParamType.DateTime,
        ),
        'user_participationSentAt': serializeParam(
          _userParticipationSentAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ParticipatingUserStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ParticipatingUserStruct(
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
        userIsParticipating: deserializeParam(
          data['user_isParticipating'],
          ParamType.bool,
          false,
        ),
        userInvitationAcceptedAt: deserializeParam(
          data['user_invitationAcceptedAt'],
          ParamType.DateTime,
          false,
        ),
        userParticipationSentAt: deserializeParam(
          data['user_participationSentAt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ParticipatingUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ParticipatingUserStruct &&
        user == other.user &&
        userID == other.userID &&
        userDisplayName == other.userDisplayName &&
        userAvatar == other.userAvatar &&
        userIsInvited == other.userIsInvited &&
        userIsParticipating == other.userIsParticipating &&
        userInvitationAcceptedAt == other.userInvitationAcceptedAt &&
        userParticipationSentAt == other.userParticipationSentAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        user,
        userID,
        userDisplayName,
        userAvatar,
        userIsInvited,
        userIsParticipating,
        userInvitationAcceptedAt,
        userParticipationSentAt
      ]);
}

ParticipatingUserStruct createParticipatingUserStruct({
  DocumentReference? user,
  String? userID,
  String? userDisplayName,
  String? userAvatar,
  bool? userIsInvited,
  bool? userIsParticipating,
  DateTime? userInvitationAcceptedAt,
  DateTime? userParticipationSentAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ParticipatingUserStruct(
      user: user,
      userID: userID,
      userDisplayName: userDisplayName,
      userAvatar: userAvatar,
      userIsInvited: userIsInvited,
      userIsParticipating: userIsParticipating,
      userInvitationAcceptedAt: userInvitationAcceptedAt,
      userParticipationSentAt: userParticipationSentAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ParticipatingUserStruct? updateParticipatingUserStruct(
  ParticipatingUserStruct? participatingUser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    participatingUser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addParticipatingUserStructData(
  Map<String, dynamic> firestoreData,
  ParticipatingUserStruct? participatingUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (participatingUser == null) {
    return;
  }
  if (participatingUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && participatingUser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final participatingUserData =
      getParticipatingUserFirestoreData(participatingUser, forFieldValue);
  final nestedData =
      participatingUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = participatingUser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getParticipatingUserFirestoreData(
  ParticipatingUserStruct? participatingUser, [
  bool forFieldValue = false,
]) {
  if (participatingUser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(participatingUser.toMap());

  // Add any Firestore field values
  participatingUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getParticipatingUserListFirestoreData(
  List<ParticipatingUserStruct>? participatingUsers,
) =>
    participatingUsers
        ?.map((e) => getParticipatingUserFirestoreData(e, true))
        .toList() ??
    [];
