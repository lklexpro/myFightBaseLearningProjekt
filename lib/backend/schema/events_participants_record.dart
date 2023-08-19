import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsParticipantsRecord extends FirestoreRecord {
  EventsParticipantsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "participatingUser" field.
  List<ParticipatingUserStruct>? _participatingUser;
  List<ParticipatingUserStruct> get participatingUser =>
      _participatingUser ?? const [];
  bool hasParticipatingUser() => _participatingUser != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _participatingUser = getStructList(
      snapshotData['participatingUser'],
      ParticipatingUserStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('events_participants')
          : FirebaseFirestore.instance.collectionGroup('events_participants');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('events_participants').doc();

  static Stream<EventsParticipantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsParticipantsRecord.fromSnapshot(s));

  static Future<EventsParticipantsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EventsParticipantsRecord.fromSnapshot(s));

  static EventsParticipantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventsParticipantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsParticipantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsParticipantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsParticipantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsParticipantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsParticipantsRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class EventsParticipantsRecordDocumentEquality
    implements Equality<EventsParticipantsRecord> {
  const EventsParticipantsRecordDocumentEquality();

  @override
  bool equals(EventsParticipantsRecord? e1, EventsParticipantsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.participatingUser, e2?.participatingUser);
  }

  @override
  int hash(EventsParticipantsRecord? e) =>
      const ListEquality().hash([e?.participatingUser]);

  @override
  bool isValidKey(Object? o) => o is EventsParticipantsRecord;
}
