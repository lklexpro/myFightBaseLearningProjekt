import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

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

  // "statistics_weightClass" field.
  String? _statisticsWeightClass;
  String get statisticsWeightClass => _statisticsWeightClass ?? '';
  bool hasStatisticsWeightClass() => _statisticsWeightClass != null;

  // "statistics_weight" field.
  double? _statisticsWeight;
  double get statisticsWeight => _statisticsWeight ?? 0.0;
  bool hasStatisticsWeight() => _statisticsWeight != null;

  // "statistics_height" field.
  double? _statisticsHeight;
  double get statisticsHeight => _statisticsHeight ?? 0.0;
  bool hasStatisticsHeight() => _statisticsHeight != null;

  // "statistics_fightsTotal" field.
  int? _statisticsFightsTotal;
  int get statisticsFightsTotal => _statisticsFightsTotal ?? 0;
  bool hasStatisticsFightsTotal() => _statisticsFightsTotal != null;

  // "statistics_fightWins" field.
  int? _statisticsFightWins;
  int get statisticsFightWins => _statisticsFightWins ?? 0;
  bool hasStatisticsFightWins() => _statisticsFightWins != null;

  // "statistics_fightLost" field.
  int? _statisticsFightLost;
  int get statisticsFightLost => _statisticsFightLost ?? 0;
  bool hasStatisticsFightLost() => _statisticsFightLost != null;

  // "statistics_fightDraw" field.
  int? _statisticsFightDraw;
  int get statisticsFightDraw => _statisticsFightDraw ?? 0;
  bool hasStatisticsFightDraw() => _statisticsFightDraw != null;

  // "statistics_boxingLeague" field.
  String? _statisticsBoxingLeague;
  String get statisticsBoxingLeague => _statisticsBoxingLeague ?? '';
  bool hasStatisticsBoxingLeague() => _statisticsBoxingLeague != null;

  // "contact_phoneNumber" field.
  String? _contactPhoneNumber;
  String get contactPhoneNumber => _contactPhoneNumber ?? '';
  bool hasContactPhoneNumber() => _contactPhoneNumber != null;

  // "contact_adressStreet" field.
  String? _contactAdressStreet;
  String get contactAdressStreet => _contactAdressStreet ?? '';
  bool hasContactAdressStreet() => _contactAdressStreet != null;

  // "contact_adressPostalCode" field.
  String? _contactAdressPostalCode;
  String get contactAdressPostalCode => _contactAdressPostalCode ?? '';
  bool hasContactAdressPostalCode() => _contactAdressPostalCode != null;

  // "contact_adressCity" field.
  String? _contactAdressCity;
  String get contactAdressCity => _contactAdressCity ?? '';
  bool hasContactAdressCity() => _contactAdressCity != null;

  // "contact_mail" field.
  String? _contactMail;
  String get contactMail => _contactMail ?? '';
  bool hasContactMail() => _contactMail != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "statistics_sportsType" field.
  String? _statisticsSportsType;
  String get statisticsSportsType => _statisticsSportsType ?? '';
  bool hasStatisticsSportsType() => _statisticsSportsType != null;

  // "bannerImage_url" field.
  String? _bannerImageUrl;
  String get bannerImageUrl => _bannerImageUrl ?? '';
  bool hasBannerImageUrl() => _bannerImageUrl != null;

  // "organizationStatus" field.
  String? _organizationStatus;
  String get organizationStatus => _organizationStatus ?? '';
  bool hasOrganizationStatus() => _organizationStatus != null;

  // "organizationStatus_postedAt" field.
  DateTime? _organizationStatusPostedAt;
  DateTime? get organizationStatusPostedAt => _organizationStatusPostedAt;
  bool hasOrganizationStatusPostedAt() => _organizationStatusPostedAt != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
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
    _statisticsWeightClass = snapshotData['statistics_weightClass'] as String?;
    _statisticsWeight = castToType<double>(snapshotData['statistics_weight']);
    _statisticsHeight = castToType<double>(snapshotData['statistics_height']);
    _statisticsFightsTotal =
        castToType<int>(snapshotData['statistics_fightsTotal']);
    _statisticsFightWins =
        castToType<int>(snapshotData['statistics_fightWins']);
    _statisticsFightLost =
        castToType<int>(snapshotData['statistics_fightLost']);
    _statisticsFightDraw =
        castToType<int>(snapshotData['statistics_fightDraw']);
    _statisticsBoxingLeague =
        snapshotData['statistics_boxingLeague'] as String?;
    _contactPhoneNumber = snapshotData['contact_phoneNumber'] as String?;
    _contactAdressStreet = snapshotData['contact_adressStreet'] as String?;
    _contactAdressPostalCode =
        snapshotData['contact_adressPostalCode'] as String?;
    _contactAdressCity = snapshotData['contact_adressCity'] as String?;
    _contactMail = snapshotData['contact_mail'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _statisticsSportsType = snapshotData['statistics_sportsType'] as String?;
    _bannerImageUrl = snapshotData['bannerImage_url'] as String?;
    _organizationStatus = snapshotData['organizationStatus'] as String?;
    _organizationStatusPostedAt =
        snapshotData['organizationStatus_postedAt'] as DateTime?;
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
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'aboutMe': snapshot.data['aboutMe'],
          'firstName': snapshot.data['firstName'],
          'lastName': snapshot.data['lastName'],
          'userType': snapshot.data['userType'],
          'recentPosts': safeGet(
            () => (snapshot.data['recentPosts'] as Iterable)
                .map((d) => RecentPostStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'isOrganization': snapshot.data['isOrganization'],
          'postsFeed': safeGet(
            () => (snapshot.data['postsFeed'] as Iterable)
                .map((d) => RecentPostStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'postsFeed_createdAt': convertAlgoliaParam(
            snapshot.data['postsFeed_createdAt'],
            ParamType.DateTime,
            false,
          ),
          'statistics_weightClass': snapshot.data['statistics_weightClass'],
          'statistics_weight': convertAlgoliaParam(
            snapshot.data['statistics_weight'],
            ParamType.double,
            false,
          ),
          'statistics_height': convertAlgoliaParam(
            snapshot.data['statistics_height'],
            ParamType.double,
            false,
          ),
          'statistics_fightsTotal': convertAlgoliaParam(
            snapshot.data['statistics_fightsTotal'],
            ParamType.int,
            false,
          ),
          'statistics_fightWins': convertAlgoliaParam(
            snapshot.data['statistics_fightWins'],
            ParamType.int,
            false,
          ),
          'statistics_fightLost': convertAlgoliaParam(
            snapshot.data['statistics_fightLost'],
            ParamType.int,
            false,
          ),
          'statistics_fightDraw': convertAlgoliaParam(
            snapshot.data['statistics_fightDraw'],
            ParamType.int,
            false,
          ),
          'statistics_boxingLeague': snapshot.data['statistics_boxingLeague'],
          'contact_phoneNumber': snapshot.data['contact_phoneNumber'],
          'contact_adressStreet': snapshot.data['contact_adressStreet'],
          'contact_adressPostalCode': snapshot.data['contact_adressPostalCode'],
          'contact_adressCity': snapshot.data['contact_adressCity'],
          'contact_mail': snapshot.data['contact_mail'],
          'phone_number': snapshot.data['phone_number'],
          'statistics_sportsType': snapshot.data['statistics_sportsType'],
          'bannerImage_url': snapshot.data['bannerImage_url'],
          'organizationStatus': snapshot.data['organizationStatus'],
          'organizationStatus_postedAt': convertAlgoliaParam(
            snapshot.data['organizationStatus_postedAt'],
            ParamType.DateTime,
            false,
          ),
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
  String? aboutMe,
  String? firstName,
  String? lastName,
  String? userType,
  bool? isOrganization,
  DateTime? postsFeedCreatedAt,
  String? statisticsWeightClass,
  double? statisticsWeight,
  double? statisticsHeight,
  int? statisticsFightsTotal,
  int? statisticsFightWins,
  int? statisticsFightLost,
  int? statisticsFightDraw,
  String? statisticsBoxingLeague,
  String? contactPhoneNumber,
  String? contactAdressStreet,
  String? contactAdressPostalCode,
  String? contactAdressCity,
  String? contactMail,
  String? phoneNumber,
  String? statisticsSportsType,
  String? bannerImageUrl,
  String? organizationStatus,
  DateTime? organizationStatusPostedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'aboutMe': aboutMe,
      'firstName': firstName,
      'lastName': lastName,
      'userType': userType,
      'isOrganization': isOrganization,
      'postsFeed_createdAt': postsFeedCreatedAt,
      'statistics_weightClass': statisticsWeightClass,
      'statistics_weight': statisticsWeight,
      'statistics_height': statisticsHeight,
      'statistics_fightsTotal': statisticsFightsTotal,
      'statistics_fightWins': statisticsFightWins,
      'statistics_fightLost': statisticsFightLost,
      'statistics_fightDraw': statisticsFightDraw,
      'statistics_boxingLeague': statisticsBoxingLeague,
      'contact_phoneNumber': contactPhoneNumber,
      'contact_adressStreet': contactAdressStreet,
      'contact_adressPostalCode': contactAdressPostalCode,
      'contact_adressCity': contactAdressCity,
      'contact_mail': contactMail,
      'phone_number': phoneNumber,
      'statistics_sportsType': statisticsSportsType,
      'bannerImage_url': bannerImageUrl,
      'organizationStatus': organizationStatus,
      'organizationStatus_postedAt': organizationStatusPostedAt,
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
        e1?.aboutMe == e2?.aboutMe &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.userType == e2?.userType &&
        listEquality.equals(e1?.recentPosts, e2?.recentPosts) &&
        e1?.isOrganization == e2?.isOrganization &&
        listEquality.equals(e1?.postsFeed, e2?.postsFeed) &&
        e1?.postsFeedCreatedAt == e2?.postsFeedCreatedAt &&
        e1?.statisticsWeightClass == e2?.statisticsWeightClass &&
        e1?.statisticsWeight == e2?.statisticsWeight &&
        e1?.statisticsHeight == e2?.statisticsHeight &&
        e1?.statisticsFightsTotal == e2?.statisticsFightsTotal &&
        e1?.statisticsFightWins == e2?.statisticsFightWins &&
        e1?.statisticsFightLost == e2?.statisticsFightLost &&
        e1?.statisticsFightDraw == e2?.statisticsFightDraw &&
        e1?.statisticsBoxingLeague == e2?.statisticsBoxingLeague &&
        e1?.contactPhoneNumber == e2?.contactPhoneNumber &&
        e1?.contactAdressStreet == e2?.contactAdressStreet &&
        e1?.contactAdressPostalCode == e2?.contactAdressPostalCode &&
        e1?.contactAdressCity == e2?.contactAdressCity &&
        e1?.contactMail == e2?.contactMail &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.statisticsSportsType == e2?.statisticsSportsType &&
        e1?.bannerImageUrl == e2?.bannerImageUrl &&
        e1?.organizationStatus == e2?.organizationStatus &&
        e1?.organizationStatusPostedAt == e2?.organizationStatusPostedAt;
  }

  @override
  int hash(AllUsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.aboutMe,
        e?.firstName,
        e?.lastName,
        e?.userType,
        e?.recentPosts,
        e?.isOrganization,
        e?.postsFeed,
        e?.postsFeedCreatedAt,
        e?.statisticsWeightClass,
        e?.statisticsWeight,
        e?.statisticsHeight,
        e?.statisticsFightsTotal,
        e?.statisticsFightWins,
        e?.statisticsFightLost,
        e?.statisticsFightDraw,
        e?.statisticsBoxingLeague,
        e?.contactPhoneNumber,
        e?.contactAdressStreet,
        e?.contactAdressPostalCode,
        e?.contactAdressCity,
        e?.contactMail,
        e?.phoneNumber,
        e?.statisticsSportsType,
        e?.bannerImageUrl,
        e?.organizationStatus,
        e?.organizationStatusPostedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is AllUsersRecord;
}
