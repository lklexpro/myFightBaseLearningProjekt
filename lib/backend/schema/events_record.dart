import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "event_description" field.
  String? _eventDescription;
  String get eventDescription => _eventDescription ?? '';
  bool hasEventDescription() => _eventDescription != null;

  // "event_date" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "event_participation_fee" field.
  double? _eventParticipationFee;
  double get eventParticipationFee => _eventParticipationFee ?? 0.0;
  bool hasEventParticipationFee() => _eventParticipationFee != null;

  // "event_isPrivate" field.
  bool? _eventIsPrivate;
  bool get eventIsPrivate => _eventIsPrivate ?? false;
  bool hasEventIsPrivate() => _eventIsPrivate != null;

  // "event_photo" field.
  List<String>? _eventPhoto;
  List<String> get eventPhoto => _eventPhoto ?? const [];
  bool hasEventPhoto() => _eventPhoto != null;

  // "event_needsRegistration" field.
  bool? _eventNeedsRegistration;
  bool get eventNeedsRegistration => _eventNeedsRegistration ?? false;
  bool hasEventNeedsRegistration() => _eventNeedsRegistration != null;

  // "event_isExpired" field.
  bool? _eventIsExpired;
  bool get eventIsExpired => _eventIsExpired ?? false;
  bool hasEventIsExpired() => _eventIsExpired != null;

  // "event_timeCreated" field.
  DateTime? _eventTimeCreated;
  DateTime? get eventTimeCreated => _eventTimeCreated;
  bool hasEventTimeCreated() => _eventTimeCreated != null;

  // "event_timeEdited" field.
  DateTime? _eventTimeEdited;
  DateTime? get eventTimeEdited => _eventTimeEdited;
  bool hasEventTimeEdited() => _eventTimeEdited != null;

  // "creator_DisplayName" field.
  String? _creatorDisplayName;
  String get creatorDisplayName => _creatorDisplayName ?? '';
  bool hasCreatorDisplayName() => _creatorDisplayName != null;

  // "creator_photoURL" field.
  String? _creatorPhotoURL;
  String get creatorPhotoURL => _creatorPhotoURL ?? '';
  bool hasCreatorPhotoURL() => _creatorPhotoURL != null;

  // "event_location" field.
  String? _eventLocation;
  String get eventLocation => _eventLocation ?? '';
  bool hasEventLocation() => _eventLocation != null;

  // "event_locationStreet" field.
  String? _eventLocationStreet;
  String get eventLocationStreet => _eventLocationStreet ?? '';
  bool hasEventLocationStreet() => _eventLocationStreet != null;

  // "event_locationPostalCode" field.
  String? _eventLocationPostalCode;
  String get eventLocationPostalCode => _eventLocationPostalCode ?? '';
  bool hasEventLocationPostalCode() => _eventLocationPostalCode != null;

  // "event_locationCity" field.
  String? _eventLocationCity;
  String get eventLocationCity => _eventLocationCity ?? '';
  bool hasEventLocationCity() => _eventLocationCity != null;

  // "userInvitationData" field.
  List<UserInvitationDataStruct>? _userInvitationData;
  List<UserInvitationDataStruct> get userInvitationData =>
      _userInvitationData ?? const [];
  bool hasUserInvitationData() => _userInvitationData != null;

  // "userList" field.
  List<DocumentReference>? _userList;
  List<DocumentReference> get userList => _userList ?? const [];
  bool hasUserList() => _userList != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "event_attendeeLimit" field.
  int? _eventAttendeeLimit;
  int get eventAttendeeLimit => _eventAttendeeLimit ?? 0;
  bool hasEventAttendeeLimit() => _eventAttendeeLimit != null;

  void _initializeFields() {
    _creator = snapshotData['creator'] as DocumentReference?;
    _eventName = snapshotData['event_name'] as String?;
    _eventDescription = snapshotData['event_description'] as String?;
    _eventDate = snapshotData['event_date'] as DateTime?;
    _eventParticipationFee =
        castToType<double>(snapshotData['event_participation_fee']);
    _eventIsPrivate = snapshotData['event_isPrivate'] as bool?;
    _eventPhoto = getDataList(snapshotData['event_photo']);
    _eventNeedsRegistration = snapshotData['event_needsRegistration'] as bool?;
    _eventIsExpired = snapshotData['event_isExpired'] as bool?;
    _eventTimeCreated = snapshotData['event_timeCreated'] as DateTime?;
    _eventTimeEdited = snapshotData['event_timeEdited'] as DateTime?;
    _creatorDisplayName = snapshotData['creator_DisplayName'] as String?;
    _creatorPhotoURL = snapshotData['creator_photoURL'] as String?;
    _eventLocation = snapshotData['event_location'] as String?;
    _eventLocationStreet = snapshotData['event_locationStreet'] as String?;
    _eventLocationPostalCode =
        snapshotData['event_locationPostalCode'] as String?;
    _eventLocationCity = snapshotData['event_locationCity'] as String?;
    _userInvitationData = getStructList(
      snapshotData['userInvitationData'],
      UserInvitationDataStruct.fromMap,
    );
    _userList = getDataList(snapshotData['userList']);
    _uid = snapshotData['uid'] as String?;
    _eventAttendeeLimit = castToType<int>(snapshotData['event_attendeeLimit']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  DocumentReference? creator,
  String? eventName,
  String? eventDescription,
  DateTime? eventDate,
  double? eventParticipationFee,
  bool? eventIsPrivate,
  bool? eventNeedsRegistration,
  bool? eventIsExpired,
  DateTime? eventTimeCreated,
  DateTime? eventTimeEdited,
  String? creatorDisplayName,
  String? creatorPhotoURL,
  String? eventLocation,
  String? eventLocationStreet,
  String? eventLocationPostalCode,
  String? eventLocationCity,
  String? uid,
  int? eventAttendeeLimit,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creator': creator,
      'event_name': eventName,
      'event_description': eventDescription,
      'event_date': eventDate,
      'event_participation_fee': eventParticipationFee,
      'event_isPrivate': eventIsPrivate,
      'event_needsRegistration': eventNeedsRegistration,
      'event_isExpired': eventIsExpired,
      'event_timeCreated': eventTimeCreated,
      'event_timeEdited': eventTimeEdited,
      'creator_DisplayName': creatorDisplayName,
      'creator_photoURL': creatorPhotoURL,
      'event_location': eventLocation,
      'event_locationStreet': eventLocationStreet,
      'event_locationPostalCode': eventLocationPostalCode,
      'event_locationCity': eventLocationCity,
      'uid': uid,
      'event_attendeeLimit': eventAttendeeLimit,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.creator == e2?.creator &&
        e1?.eventName == e2?.eventName &&
        e1?.eventDescription == e2?.eventDescription &&
        e1?.eventDate == e2?.eventDate &&
        e1?.eventParticipationFee == e2?.eventParticipationFee &&
        e1?.eventIsPrivate == e2?.eventIsPrivate &&
        listEquality.equals(e1?.eventPhoto, e2?.eventPhoto) &&
        e1?.eventNeedsRegistration == e2?.eventNeedsRegistration &&
        e1?.eventIsExpired == e2?.eventIsExpired &&
        e1?.eventTimeCreated == e2?.eventTimeCreated &&
        e1?.eventTimeEdited == e2?.eventTimeEdited &&
        e1?.creatorDisplayName == e2?.creatorDisplayName &&
        e1?.creatorPhotoURL == e2?.creatorPhotoURL &&
        e1?.eventLocation == e2?.eventLocation &&
        e1?.eventLocationStreet == e2?.eventLocationStreet &&
        e1?.eventLocationPostalCode == e2?.eventLocationPostalCode &&
        e1?.eventLocationCity == e2?.eventLocationCity &&
        listEquality.equals(e1?.userInvitationData, e2?.userInvitationData) &&
        listEquality.equals(e1?.userList, e2?.userList) &&
        e1?.uid == e2?.uid &&
        e1?.eventAttendeeLimit == e2?.eventAttendeeLimit;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.creator,
        e?.eventName,
        e?.eventDescription,
        e?.eventDate,
        e?.eventParticipationFee,
        e?.eventIsPrivate,
        e?.eventPhoto,
        e?.eventNeedsRegistration,
        e?.eventIsExpired,
        e?.eventTimeCreated,
        e?.eventTimeEdited,
        e?.creatorDisplayName,
        e?.creatorPhotoURL,
        e?.eventLocation,
        e?.eventLocationStreet,
        e?.eventLocationPostalCode,
        e?.eventLocationCity,
        e?.userInvitationData,
        e?.userList,
        e?.uid,
        e?.eventAttendeeLimit
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
