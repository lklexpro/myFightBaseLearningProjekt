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
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? checkIfUserDataStructIsInList(
  List<UserRelationDataStruct> selectedUsers,
  UserRelationDataStruct userDataItem,
) {
  var foundUser = selectedUsers
      //.any((element) => element.toMap().containsValue(otherUser.uid));
      .any((element) => element.userID == userDataItem.userID);

  return foundUser;
}

List<UserRelationDataStruct>? aggregateUserDataStructLists(
  List<UserRelationDataStruct> userRelationData,
  List<UserRelationDataStruct>? userRelationData2,
) {
  List<UserRelationDataStruct> aggregatedList = [];

  for (int i = 0; i < userRelationData.length; i++) {
    aggregatedList.add(userRelationData[i]);
  }

  if (userRelationData2 != null) {
    for (int i2 = 0; i2 < userRelationData2.length; i2++) {
      aggregatedList.add(userRelationData2[i2]);
    }
  }

  return aggregatedList;
}

List<String>? convertUserDataStructsToListOfIDs(
  List<UserRelationDataStruct> userRelationData,
  List<UserRelationDataStruct>? userRelationData2,
) {
  List<String> listofUserIDs = [];

  for (int i = 0; i < userRelationData.length; i++) {
    listofUserIDs.add(userRelationData[i].userID);
  }

  if (userRelationData2 != null) {
    for (int i2 = 0; i2 < userRelationData2.length; i2++) {
      listofUserIDs.add(userRelationData2[i2].userID);
    }
  }

  return listofUserIDs = listofUserIDs.toSet().toList();
}

String? returnUserResponseFromInvitationDataStructList(
  List<UserInvitationDataStruct> userInvitationDataList,
  String userID,
) {
  var userResponse = null;

  for (int i = 0; i < userInvitationDataList.length; i++) {
    if (userInvitationDataList[i].userID == userID) {
      userResponse = userInvitationDataList[i].userInvitationResponse;
    }
  }

  return userResponse;
}

bool checkIfUserIDisInUserRelationDataStructList(
  List<UserRelationDataStruct> userRelationDataList,
  String userID,
) {
  var foundUser = userRelationDataList
      //.any((element) => element.toMap().containsValue(otherUser.uid));
      .any((element) => element.userID == userID);

  return foundUser;
}

List<String>? convertRelationDataStructsToListOfIDs(
    List<UserInvitationDataStruct> userInvitationData) {
  List<String> listofUserIDs = [];

  for (int i = 0; i < userInvitationData.length; i++) {
    listofUserIDs.add(userInvitationData[i].userID);
  }

  return listofUserIDs = listofUserIDs.toSet().toList();
}

List<UserRelationDataStruct> sortListOfUserDataStructByLabel(
    List<UserRelationDataStruct> userRelationDataList) {
  // loop list of userRelationData and sort by value in array
  userRelationDataList.sort(
      (b, a) => a.relationLabels.join().compareTo(b.relationLabels.join()));
  return userRelationDataList;
}

bool checkIfUserIDisInInvitationDataStructList(
  List<UserInvitationDataStruct> userInvitationDataList,
  String userID,
) {
  var foundUser = userInvitationDataList
      //.any((element) => element.toMap().containsValue(otherUser.uid));
      .any((element) => element.userID == userID);

  return foundUser;
}
