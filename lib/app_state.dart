import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _userShowWelcomePopup =
          await secureStorage.getBool('ff_userShowWelcomePopup') ??
              _userShowWelcomePopup;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<String> _weightClasses = [
    'Minimumgewicht',
    'Strohgewicht',
    'Leichtfliegengewicht',
    'Fliegengewicht',
    'Superfliegengewicht',
    'Bantamgewicht',
    'Superbantamgewicht',
    'Superfedergewicht',
    'Superleichtgewicht',
    'Weltergewicht',
    'Superweltergewicht',
    'Mittelgewicht',
    'Supermittelgewicht',
    'Halbschwergewicht',
    'Cruisergewicht',
    'Bridgergewicht',
    'Schwergewicht'
  ];
  List<String> get weightClasses => _weightClasses;
  set weightClasses(List<String> _value) {
    _weightClasses = _value;
  }

  void addToWeightClasses(String _value) {
    _weightClasses.add(_value);
  }

  void removeFromWeightClasses(String _value) {
    _weightClasses.remove(_value);
  }

  void removeAtIndexFromWeightClasses(int _index) {
    _weightClasses.removeAt(_index);
  }

  void updateWeightClassesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _weightClasses[_index] = updateFn(_weightClasses[_index]);
  }

  void insertAtIndexInWeightClasses(int _index, String _value) {
    _weightClasses.insert(_index, _value);
  }

  List<DocumentReference> _recentlyVisitedUserProfiles = [];
  List<DocumentReference> get recentlyVisitedUserProfiles =>
      _recentlyVisitedUserProfiles;
  set recentlyVisitedUserProfiles(List<DocumentReference> _value) {
    _recentlyVisitedUserProfiles = _value;
  }

  void addToRecentlyVisitedUserProfiles(DocumentReference _value) {
    _recentlyVisitedUserProfiles.add(_value);
  }

  void removeFromRecentlyVisitedUserProfiles(DocumentReference _value) {
    _recentlyVisitedUserProfiles.remove(_value);
  }

  void removeAtIndexFromRecentlyVisitedUserProfiles(int _index) {
    _recentlyVisitedUserProfiles.removeAt(_index);
  }

  void updateRecentlyVisitedUserProfilesAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _recentlyVisitedUserProfiles[_index] =
        updateFn(_recentlyVisitedUserProfiles[_index]);
  }

  void insertAtIndexInRecentlyVisitedUserProfiles(
      int _index, DocumentReference _value) {
    _recentlyVisitedUserProfiles.insert(_index, _value);
  }

  List<UserRelationDataStruct> _listUserRelationDataTempStorage = [];
  List<UserRelationDataStruct> get listUserRelationDataTempStorage =>
      _listUserRelationDataTempStorage;
  set listUserRelationDataTempStorage(List<UserRelationDataStruct> _value) {
    _listUserRelationDataTempStorage = _value;
  }

  void addToListUserRelationDataTempStorage(UserRelationDataStruct _value) {
    _listUserRelationDataTempStorage.add(_value);
  }

  void removeFromListUserRelationDataTempStorage(
      UserRelationDataStruct _value) {
    _listUserRelationDataTempStorage.remove(_value);
  }

  void removeAtIndexFromListUserRelationDataTempStorage(int _index) {
    _listUserRelationDataTempStorage.removeAt(_index);
  }

  void updateListUserRelationDataTempStorageAtIndex(
    int _index,
    UserRelationDataStruct Function(UserRelationDataStruct) updateFn,
  ) {
    _listUserRelationDataTempStorage[_index] =
        updateFn(_listUserRelationDataTempStorage[_index]);
  }

  void insertAtIndexInListUserRelationDataTempStorage(
      int _index, UserRelationDataStruct _value) {
    _listUserRelationDataTempStorage.insert(_index, _value);
  }

  bool _listSearchSelectAllMembers = false;
  bool get listSearchSelectAllMembers => _listSearchSelectAllMembers;
  set listSearchSelectAllMembers(bool _value) {
    _listSearchSelectAllMembers = _value;
  }

  bool _listSearchSelectAllFollowers = false;
  bool get listSearchSelectAllFollowers => _listSearchSelectAllFollowers;
  set listSearchSelectAllFollowers(bool _value) {
    _listSearchSelectAllFollowers = _value;
  }

  List<UserRelationDataStruct> _listUserRelationDataTempStorage2 = [];
  List<UserRelationDataStruct> get listUserRelationDataTempStorage2 =>
      _listUserRelationDataTempStorage2;
  set listUserRelationDataTempStorage2(List<UserRelationDataStruct> _value) {
    _listUserRelationDataTempStorage2 = _value;
  }

  void addToListUserRelationDataTempStorage2(UserRelationDataStruct _value) {
    _listUserRelationDataTempStorage2.add(_value);
  }

  void removeFromListUserRelationDataTempStorage2(
      UserRelationDataStruct _value) {
    _listUserRelationDataTempStorage2.remove(_value);
  }

  void removeAtIndexFromListUserRelationDataTempStorage2(int _index) {
    _listUserRelationDataTempStorage2.removeAt(_index);
  }

  void updateListUserRelationDataTempStorage2AtIndex(
    int _index,
    UserRelationDataStruct Function(UserRelationDataStruct) updateFn,
  ) {
    _listUserRelationDataTempStorage2[_index] =
        updateFn(_listUserRelationDataTempStorage2[_index]);
  }

  void insertAtIndexInListUserRelationDataTempStorage2(
      int _index, UserRelationDataStruct _value) {
    _listUserRelationDataTempStorage2.insert(_index, _value);
  }

  List<String> _memberLabels = [
    'Inhaber',
    'Vorstandsmitglied',
    'Vertreter',
    'Trainer'
  ];
  List<String> get memberLabels => _memberLabels;
  set memberLabels(List<String> _value) {
    _memberLabels = _value;
  }

  void addToMemberLabels(String _value) {
    _memberLabels.add(_value);
  }

  void removeFromMemberLabels(String _value) {
    _memberLabels.remove(_value);
  }

  void removeAtIndexFromMemberLabels(int _index) {
    _memberLabels.removeAt(_index);
  }

  void updateMemberLabelsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _memberLabels[_index] = updateFn(_memberLabels[_index]);
  }

  void insertAtIndexInMemberLabels(int _index, String _value) {
    _memberLabels.insert(_index, _value);
  }

  bool _userShowWelcomePopup = true;
  bool get userShowWelcomePopup => _userShowWelcomePopup;
  set userShowWelcomePopup(bool _value) {
    _userShowWelcomePopup = _value;
    secureStorage.setBool('ff_userShowWelcomePopup', _value);
  }

  void deleteUserShowWelcomePopup() {
    secureStorage.delete(key: 'ff_userShowWelcomePopup');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
