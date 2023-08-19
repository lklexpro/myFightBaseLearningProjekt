import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

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

  // "event_location" field.
  String? _eventLocation;
  String get eventLocation => _eventLocation ?? '';
  bool hasEventLocation() => _eventLocation != null;

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

  // "num_participants" field.
  int? _numParticipants;
  int get numParticipants => _numParticipants ?? 0;
  bool hasNumParticipants() => _numParticipants != null;

  // "event_participants" field.
  List<ParticipatingUserStruct>? _eventParticipants;
  List<ParticipatingUserStruct> get eventParticipants =>
      _eventParticipants ?? const [];
  bool hasEventParticipants() => _eventParticipants != null;

  // "creator_DisplayName" field.
  String? _creatorDisplayName;
  String get creatorDisplayName => _creatorDisplayName ?? '';
  bool hasCreatorDisplayName() => _creatorDisplayName != null;

  // "creator_photoURL" field.
  String? _creatorPhotoURL;
  String get creatorPhotoURL => _creatorPhotoURL ?? '';
  bool hasCreatorPhotoURL() => _creatorPhotoURL != null;

  void _initializeFields() {
    _creator = snapshotData['creator'] as DocumentReference?;
    _eventName = snapshotData['event_name'] as String?;
    _eventDescription = snapshotData['event_description'] as String?;
    _eventLocation = snapshotData['event_location'] as String?;
    _eventDate = snapshotData['event_date'] as DateTime?;
    _eventParticipationFee =
        castToType<double>(snapshotData['event_participation_fee']);
    _eventIsPrivate = snapshotData['event_isPrivate'] as bool?;
    _eventPhoto = getDataList(snapshotData['event_photo']);
    _eventNeedsRegistration = snapshotData['event_needsRegistration'] as bool?;
    _eventIsExpired = snapshotData['event_isExpired'] as bool?;
    _eventTimeCreated = snapshotData['event_timeCreated'] as DateTime?;
    _eventTimeEdited = snapshotData['event_timeEdited'] as DateTime?;
    _numParticipants = castToType<int>(snapshotData['num_participants']);
    _eventParticipants = getStructList(
      snapshotData['event_participants'],
      ParticipatingUserStruct.fromMap,
    );
    _creatorDisplayName = snapshotData['creator_DisplayName'] as String?;
    _creatorPhotoURL = snapshotData['creator_photoURL'] as String?;
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
  String? eventLocation,
  DateTime? eventDate,
  double? eventParticipationFee,
  bool? eventIsPrivate,
  bool? eventNeedsRegistration,
  bool? eventIsExpired,
  DateTime? eventTimeCreated,
  DateTime? eventTimeEdited,
  int? numParticipants,
  String? creatorDisplayName,
  String? creatorPhotoURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creator': creator,
      'event_name': eventName,
      'event_description': eventDescription,
      'event_location': eventLocation,
      'event_date': eventDate,
      'event_participation_fee': eventParticipationFee,
      'event_isPrivate': eventIsPrivate,
      'event_needsRegistration': eventNeedsRegistration,
      'event_isExpired': eventIsExpired,
      'event_timeCreated': eventTimeCreated,
      'event_timeEdited': eventTimeEdited,
      'num_participants': numParticipants,
      'creator_DisplayName': creatorDisplayName,
      'creator_photoURL': creatorPhotoURL,
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
        e1?.eventLocation == e2?.eventLocation &&
        e1?.eventDate == e2?.eventDate &&
        e1?.eventParticipationFee == e2?.eventParticipationFee &&
        e1?.eventIsPrivate == e2?.eventIsPrivate &&
        listEquality.equals(e1?.eventPhoto, e2?.eventPhoto) &&
        e1?.eventNeedsRegistration == e2?.eventNeedsRegistration &&
        e1?.eventIsExpired == e2?.eventIsExpired &&
        e1?.eventTimeCreated == e2?.eventTimeCreated &&
        e1?.eventTimeEdited == e2?.eventTimeEdited &&
        e1?.numParticipants == e2?.numParticipants &&
        listEquality.equals(e1?.eventParticipants, e2?.eventParticipants) &&
        e1?.creatorDisplayName == e2?.creatorDisplayName &&
        e1?.creatorPhotoURL == e2?.creatorPhotoURL;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.creator,
        e?.eventName,
        e?.eventDescription,
        e?.eventLocation,
        e?.eventDate,
        e?.eventParticipationFee,
        e?.eventIsPrivate,
        e?.eventPhoto,
        e?.eventNeedsRegistration,
        e?.eventIsExpired,
        e?.eventTimeCreated,
        e?.eventTimeEdited,
        e?.numParticipants,
        e?.eventParticipants,
        e?.creatorDisplayName,
        e?.creatorPhotoURL
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
