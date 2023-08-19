import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _userIsOrganization = false;
  bool get userIsOrganization => _userIsOrganization;
  set userIsOrganization(bool _value) {
    _userIsOrganization = _value;
  }

  bool _selectedAllMembersForInvitation = false;
  bool get selectedAllMembersForInvitation => _selectedAllMembersForInvitation;
  set selectedAllMembersForInvitation(bool _value) {
    _selectedAllMembersForInvitation = _value;
  }

  List<UserRelationDataStruct> _selectedMembersForEventInvitation = [];
  List<UserRelationDataStruct> get selectedMembersForEventInvitation =>
      _selectedMembersForEventInvitation;
  set selectedMembersForEventInvitation(List<UserRelationDataStruct> _value) {
    _selectedMembersForEventInvitation = _value;
  }

  void addToSelectedMembersForEventInvitation(UserRelationDataStruct _value) {
    _selectedMembersForEventInvitation.add(_value);
  }

  void removeFromSelectedMembersForEventInvitation(
      UserRelationDataStruct _value) {
    _selectedMembersForEventInvitation.remove(_value);
  }

  void removeAtIndexFromSelectedMembersForEventInvitation(int _index) {
    _selectedMembersForEventInvitation.removeAt(_index);
  }

  void updateSelectedMembersForEventInvitationAtIndex(
    int _index,
    UserRelationDataStruct Function(UserRelationDataStruct) updateFn,
  ) {
    _selectedMembersForEventInvitation[_index] =
        updateFn(_selectedMembersForEventInvitation[_index]);
  }

  List<UserRelationDataStruct> _selectedFollowersForEventInvitation = [];
  List<UserRelationDataStruct> get selectedFollowersForEventInvitation =>
      _selectedFollowersForEventInvitation;
  set selectedFollowersForEventInvitation(List<UserRelationDataStruct> _value) {
    _selectedFollowersForEventInvitation = _value;
  }

  void addToSelectedFollowersForEventInvitation(UserRelationDataStruct _value) {
    _selectedFollowersForEventInvitation.add(_value);
  }

  void removeFromSelectedFollowersForEventInvitation(
      UserRelationDataStruct _value) {
    _selectedFollowersForEventInvitation.remove(_value);
  }

  void removeAtIndexFromSelectedFollowersForEventInvitation(int _index) {
    _selectedFollowersForEventInvitation.removeAt(_index);
  }

  void updateSelectedFollowersForEventInvitationAtIndex(
    int _index,
    UserRelationDataStruct Function(UserRelationDataStruct) updateFn,
  ) {
    _selectedFollowersForEventInvitation[_index] =
        updateFn(_selectedFollowersForEventInvitation[_index]);
  }

  bool _selectedAllFollowersForInvitation = false;
  bool get selectedAllFollowersForInvitation =>
      _selectedAllFollowersForInvitation;
  set selectedAllFollowersForInvitation(bool _value) {
    _selectedAllFollowersForInvitation = _value;
  }

  final _authUserProfileDocManager = FutureRequestManager<AllUsersRecord>();
  Future<AllUsersRecord> authUserProfileDoc({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<AllUsersRecord> Function() requestFn,
  }) =>
      _authUserProfileDocManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAuthUserProfileDocCache() => _authUserProfileDocManager.clear();
  void clearAuthUserProfileDocCacheKey(String? uniqueKey) =>
      _authUserProfileDocManager.clearRequest(uniqueKey);
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
