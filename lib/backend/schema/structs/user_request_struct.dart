// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRequestStruct extends FFFirebaseStruct {
  UserRequestStruct({
    DocumentReference? userSender,
    String? userSenderID,
    String? senderDisplayName,
    String? senderAvatar,
    DocumentReference? userReceiver,
    String? userReceiverID,
    String? receiverDisplayName,
    String? receiverAvatar,
    DateTime? createdAt,
    String? requestType,
    String? requestState,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userSender = userSender,
        _userSenderID = userSenderID,
        _senderDisplayName = senderDisplayName,
        _senderAvatar = senderAvatar,
        _userReceiver = userReceiver,
        _userReceiverID = userReceiverID,
        _receiverDisplayName = receiverDisplayName,
        _receiverAvatar = receiverAvatar,
        _createdAt = createdAt,
        _requestType = requestType,
        _requestState = requestState,
        super(firestoreUtilData);

  // "user_sender" field.
  DocumentReference? _userSender;
  DocumentReference? get userSender => _userSender;
  set userSender(DocumentReference? val) => _userSender = val;
  bool hasUserSender() => _userSender != null;

  // "user_senderID" field.
  String? _userSenderID;
  String get userSenderID => _userSenderID ?? '';
  set userSenderID(String? val) => _userSenderID = val;
  bool hasUserSenderID() => _userSenderID != null;

  // "sender_displayName" field.
  String? _senderDisplayName;
  String get senderDisplayName => _senderDisplayName ?? '';
  set senderDisplayName(String? val) => _senderDisplayName = val;
  bool hasSenderDisplayName() => _senderDisplayName != null;

  // "sender_avatar" field.
  String? _senderAvatar;
  String get senderAvatar => _senderAvatar ?? '';
  set senderAvatar(String? val) => _senderAvatar = val;
  bool hasSenderAvatar() => _senderAvatar != null;

  // "user_receiver" field.
  DocumentReference? _userReceiver;
  DocumentReference? get userReceiver => _userReceiver;
  set userReceiver(DocumentReference? val) => _userReceiver = val;
  bool hasUserReceiver() => _userReceiver != null;

  // "user_receiverID" field.
  String? _userReceiverID;
  String get userReceiverID => _userReceiverID ?? '';
  set userReceiverID(String? val) => _userReceiverID = val;
  bool hasUserReceiverID() => _userReceiverID != null;

  // "receiver_displayName" field.
  String? _receiverDisplayName;
  String get receiverDisplayName => _receiverDisplayName ?? '';
  set receiverDisplayName(String? val) => _receiverDisplayName = val;
  bool hasReceiverDisplayName() => _receiverDisplayName != null;

  // "receiver_avatar" field.
  String? _receiverAvatar;
  String get receiverAvatar => _receiverAvatar ?? '';
  set receiverAvatar(String? val) => _receiverAvatar = val;
  bool hasReceiverAvatar() => _receiverAvatar != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "requestType" field.
  String? _requestType;
  String get requestType => _requestType ?? '';
  set requestType(String? val) => _requestType = val;
  bool hasRequestType() => _requestType != null;

  // "requestState" field.
  String? _requestState;
  String get requestState => _requestState ?? '';
  set requestState(String? val) => _requestState = val;
  bool hasRequestState() => _requestState != null;

  static UserRequestStruct fromMap(Map<String, dynamic> data) =>
      UserRequestStruct(
        userSender: data['user_sender'] as DocumentReference?,
        userSenderID: data['user_senderID'] as String?,
        senderDisplayName: data['sender_displayName'] as String?,
        senderAvatar: data['sender_avatar'] as String?,
        userReceiver: data['user_receiver'] as DocumentReference?,
        userReceiverID: data['user_receiverID'] as String?,
        receiverDisplayName: data['receiver_displayName'] as String?,
        receiverAvatar: data['receiver_avatar'] as String?,
        createdAt: data['createdAt'] as DateTime?,
        requestType: data['requestType'] as String?,
        requestState: data['requestState'] as String?,
      );

  static UserRequestStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserRequestStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'user_sender': _userSender,
        'user_senderID': _userSenderID,
        'sender_displayName': _senderDisplayName,
        'sender_avatar': _senderAvatar,
        'user_receiver': _userReceiver,
        'user_receiverID': _userReceiverID,
        'receiver_displayName': _receiverDisplayName,
        'receiver_avatar': _receiverAvatar,
        'createdAt': _createdAt,
        'requestType': _requestType,
        'requestState': _requestState,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_sender': serializeParam(
          _userSender,
          ParamType.DocumentReference,
        ),
        'user_senderID': serializeParam(
          _userSenderID,
          ParamType.String,
        ),
        'sender_displayName': serializeParam(
          _senderDisplayName,
          ParamType.String,
        ),
        'sender_avatar': serializeParam(
          _senderAvatar,
          ParamType.String,
        ),
        'user_receiver': serializeParam(
          _userReceiver,
          ParamType.DocumentReference,
        ),
        'user_receiverID': serializeParam(
          _userReceiverID,
          ParamType.String,
        ),
        'receiver_displayName': serializeParam(
          _receiverDisplayName,
          ParamType.String,
        ),
        'receiver_avatar': serializeParam(
          _receiverAvatar,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'requestType': serializeParam(
          _requestType,
          ParamType.String,
        ),
        'requestState': serializeParam(
          _requestState,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserRequestStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserRequestStruct(
        userSender: deserializeParam(
          data['user_sender'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['all_users'],
        ),
        userSenderID: deserializeParam(
          data['user_senderID'],
          ParamType.String,
          false,
        ),
        senderDisplayName: deserializeParam(
          data['sender_displayName'],
          ParamType.String,
          false,
        ),
        senderAvatar: deserializeParam(
          data['sender_avatar'],
          ParamType.String,
          false,
        ),
        userReceiver: deserializeParam(
          data['user_receiver'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['all_users'],
        ),
        userReceiverID: deserializeParam(
          data['user_receiverID'],
          ParamType.String,
          false,
        ),
        receiverDisplayName: deserializeParam(
          data['receiver_displayName'],
          ParamType.String,
          false,
        ),
        receiverAvatar: deserializeParam(
          data['receiver_avatar'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        requestType: deserializeParam(
          data['requestType'],
          ParamType.String,
          false,
        ),
        requestState: deserializeParam(
          data['requestState'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserRequestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserRequestStruct &&
        userSender == other.userSender &&
        userSenderID == other.userSenderID &&
        senderDisplayName == other.senderDisplayName &&
        senderAvatar == other.senderAvatar &&
        userReceiver == other.userReceiver &&
        userReceiverID == other.userReceiverID &&
        receiverDisplayName == other.receiverDisplayName &&
        receiverAvatar == other.receiverAvatar &&
        createdAt == other.createdAt &&
        requestType == other.requestType &&
        requestState == other.requestState;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userSender,
        userSenderID,
        senderDisplayName,
        senderAvatar,
        userReceiver,
        userReceiverID,
        receiverDisplayName,
        receiverAvatar,
        createdAt,
        requestType,
        requestState
      ]);
}

UserRequestStruct createUserRequestStruct({
  DocumentReference? userSender,
  String? userSenderID,
  String? senderDisplayName,
  String? senderAvatar,
  DocumentReference? userReceiver,
  String? userReceiverID,
  String? receiverDisplayName,
  String? receiverAvatar,
  DateTime? createdAt,
  String? requestType,
  String? requestState,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserRequestStruct(
      userSender: userSender,
      userSenderID: userSenderID,
      senderDisplayName: senderDisplayName,
      senderAvatar: senderAvatar,
      userReceiver: userReceiver,
      userReceiverID: userReceiverID,
      receiverDisplayName: receiverDisplayName,
      receiverAvatar: receiverAvatar,
      createdAt: createdAt,
      requestType: requestType,
      requestState: requestState,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserRequestStruct? updateUserRequestStruct(
  UserRequestStruct? userRequest, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userRequest
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserRequestStructData(
  Map<String, dynamic> firestoreData,
  UserRequestStruct? userRequest,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userRequest == null) {
    return;
  }
  if (userRequest.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userRequest.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userRequestData =
      getUserRequestFirestoreData(userRequest, forFieldValue);
  final nestedData =
      userRequestData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userRequest.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserRequestFirestoreData(
  UserRequestStruct? userRequest, [
  bool forFieldValue = false,
]) {
  if (userRequest == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userRequest.toMap());

  // Add any Firestore field values
  userRequest.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserRequestListFirestoreData(
  List<UserRequestStruct>? userRequests,
) =>
    userRequests?.map((e) => getUserRequestFirestoreData(e, true)).toList() ??
    [];
