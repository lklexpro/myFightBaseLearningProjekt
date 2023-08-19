import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllUsersRecord extends FirestoreRecord {
  AllUsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "aboutMe" field.
  String? _aboutMe;
  String get aboutMe => _aboutMe ?? '';
  bool hasAboutMe() => _aboutMe != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "userType" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  // "recentPosts" field.
  List<RecentPostStruct>? _recentPosts;
  List<RecentPostStruct> get recentPosts => _recentPosts ?? const [];
  bool hasRecentPosts() => _recentPosts != null;

  // "isOrganization" field.
  bool? _isOrganization;
  bool get isOrganization => _isOrganization ?? false;
  bool hasIsOrganization() => _isOrganization != null;

  // "postsFeed" field.
  List<RecentPostStruct>? _postsFeed;
  List<RecentPostStruct> get postsFeed => _postsFeed ?? const [];
  bool hasPostsFeed() => _postsFeed != null;

  // "postsFeed_createdAt" field.
  DateTime? _postsFeedCreatedAt;
  DateTime? get postsFeedCreatedAt => _postsFeedCreatedAt;
  bool hasPostsFeedCreatedAt() => _postsFeedCreatedAt != null;

  // "statistics_weight" field.
  int? _statisticsWeight;
  int get statisticsWeight => _statisticsWeight ?? 0;
  bool hasStatisticsWeight() => _statisticsWeight != null;

  // "satistics_height" field.
  int? _satisticsHeight;
  int get satisticsHeight => _satisticsHeight ?? 0;
  bool hasSatisticsHeight() => _satisticsHeight != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _aboutMe = snapshotData['aboutMe'] as String?;
    _firstName = snapshotData['firstName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _userType = snapshotData['userType'] as String?;
    _recentPosts = getStructList(
      snapshotData['recentPosts'],
      RecentPostStruct.fromMap,
    );
    _isOrganization = snapshotData['isOrganization'] as bool?;
    _postsFeed = getStructList(
      snapshotData['postsFeed'],
      RecentPostStruct.fromMap,
    );
    _postsFeedCreatedAt = snapshotData['postsFeed_createdAt'] as DateTime?;
    _statisticsWeight = castToType<int>(snapshotData['statistics_weight']);
    _satisticsHeight = castToType<int>(snapshotData['satistics_height']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('all_users');

  static Stream<AllUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AllUsersRecord.fromSnapshot(s));

  static Future<AllUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AllUsersRecord.fromSnapshot(s));

  static AllUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AllUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AllUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AllUsersRecord._(reference, mapFromFirestore(data));

  static AllUsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      AllUsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['created_time']),
          ),
          'phone_number': snapshot.data['phone_number'],
          'aboutMe': snapshot.data['aboutMe'],
          'firstName': snapshot.data['firstName'],
          'lastName': snapshot.data['lastName'],
          'userType': snapshot.data['userType'],
          'recentPosts': safeGet(
            () => (snapshot.data['recentPosts'] as Iterable)
                .map(
                  (data) => createRecentPostStruct(
                    postID: safeGet(
                      () => toRef((data as Map<String, dynamic>)['postID']),
                    ),
                    timePosted: safeGet(
                      () => DateTime.fromMillisecondsSinceEpoch(
                          (data as Map<String, dynamic>)['timePosted']),
                    ),
                    create: true,
                    clearUnsetFields: false,
                  ).toMap(),
                )
                .toList(),
          ),
          'isOrganization': snapshot.data['isOrganization'],
          'postsFeed': safeGet(
            () => (snapshot.data['postsFeed'] as Iterable)
                .map(
                  (data) => createRecentPostStruct(
                    postID: safeGet(
                      () => toRef((data as Map<String, dynamic>)['postID']),
                    ),
                    timePosted: safeGet(
                      () => DateTime.fromMillisecondsSinceEpoch(
                          (data as Map<String, dynamic>)['timePosted']),
                    ),
                    create: true,
                    clearUnsetFields: false,
                  ).toMap(),
                )
                .toList(),
          ),
          'postsFeed_createdAt': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['postsFeed_createdAt']),
          ),
          'statistics_weight': snapshot.data['statistics_weight']?.round(),
          'satistics_height': snapshot.data['satistics_height']?.round(),
        },
        AllUsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AllUsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'all_users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'AllUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AllUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAllUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? aboutMe,
  String? firstName,
  String? lastName,
  String? userType,
  bool? isOrganization,
  DateTime? postsFeedCreatedAt,
  int? statisticsWeight,
  int? satisticsHeight,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'aboutMe': aboutMe,
      'firstName': firstName,
      'lastName': lastName,
      'userType': userType,
      'isOrganization': isOrganization,
      'postsFeed_createdAt': postsFeedCreatedAt,
      'statistics_weight': statisticsWeight,
      'satistics_height': satisticsHeight,
    }.withoutNulls,
  );

  return firestoreData;
}

class AllUsersRecordDocumentEquality implements Equality<AllUsersRecord> {
  const AllUsersRecordDocumentEquality();

  @override
  bool equals(AllUsersRecord? e1, AllUsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.aboutMe == e2?.aboutMe &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.userType == e2?.userType &&
        listEquality.equals(e1?.recentPosts, e2?.recentPosts) &&
        e1?.isOrganization == e2?.isOrganization &&
        listEquality.equals(e1?.postsFeed, e2?.postsFeed) &&
        e1?.postsFeedCreatedAt == e2?.postsFeedCreatedAt &&
        e1?.statisticsWeight == e2?.statisticsWeight &&
        e1?.satisticsHeight == e2?.satisticsHeight;
  }

  @override
  int hash(AllUsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.aboutMe,
        e?.firstName,
        e?.lastName,
        e?.userType,
        e?.recentPosts,
        e?.isOrganization,
        e?.postsFeed,
        e?.postsFeedCreatedAt,
        e?.statisticsWeight,
        e?.satisticsHeight
      ]);

  @override
  bool isValidKey(Object? o) => o is AllUsersRecord;
}
