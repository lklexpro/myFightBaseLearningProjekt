import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? checkIfUserIsMember(
  UserMembersRecord myMembers,
  AllUsersRecord otherUser,
) {
  var foundMember = myMembers.userData
      //.any((element) => element.toMap().containsValue(otherUser.uid));
      .any((element) => element.userID == otherUser.uid);

  return foundMember;
}

bool? checkIfFollowingThisUser(
  UserFollowsRecord myUserFollows,
  AllUsersRecord otherUser,
) {
  var foundFollowing = myUserFollows.userData
      //.any((element) => element.toMap().containsValue(otherUser.uid));
      .any((element) => element.userID == otherUser.uid);

  return foundFollowing;
}

UserRelationDataStruct? returnUserRelationDataFollowedByThisUser(
  UserFollowersRecord userFollowers,
  String? userId,
) {
  for (var element in userFollowers.userData) {
    if (element.userID == userId) {
      return element;
    }
  }
}

bool? checkIfUserIsInSelectedList(
  List<UserRelationDataStruct> selectedUsers,
  UserRelationDataStruct userDataItem,
) {
  var foundUser = selectedUsers
      //.any((element) => element.toMap().containsValue(otherUser.uid));
      .any((element) => element.userID == userDataItem.userID);

  return foundUser;
}

bool? checkIfUserIsFollower(
  UserFollowersRecord myFollowers,
  AllUsersRecord otherUser,
) {
  var foundMember = myFollowers.userData
      //.any((element) => element.toMap().containsValue(otherUser.uid));
      .any((element) => element.userID == otherUser.uid);

  return foundMember;
}

UserRelationDataStruct? returnUserRelationDataFollowingThisUser(
  UserFollowsRecord userFollows,
  String? userId,
) {
  for (var element in userFollows.userData) {
    if (element.userID == userId) {
      return element;
    }
  }
}
