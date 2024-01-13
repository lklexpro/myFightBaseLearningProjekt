import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).tertiary,
          child: Center(
            child: Image.asset(
              'assets/images/fightbase_logo.png',
              width: MediaQuery.sizeOf(context).width * 0.65,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': (data) async => ParameterData(
        allParams: {
          'showNewUserGuide': getParameter<bool>(data, 'showNewUserGuide'),
        },
      ),
  'PageAuthentication': ParameterData.none(),
  'PageRegisterAccount': ParameterData.none(),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<AllUsersRecord>(
              data, 'chatUser', AllUsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'PageAllUsers': ParameterData.none(),
  'PageUserProfile': (data) async => ParameterData(
        allParams: {
          'userProfileDoc': await getDocumentParameter<AllUsersRecord>(
              data, 'userProfileDoc', AllUsersRecord.fromSnapshot),
        },
      ),
  'PageUserProfileEdit': ParameterData.none(),
  'PageEventDetailPage': (data) async => ParameterData(
        allParams: {
          'documentEvent': await getDocumentParameter<EventsRecord>(
              data, 'documentEvent', EventsRecord.fromSnapshot),
        },
      ),
  'PageSocialPostDetailPage': (data) async => ParameterData(
        allParams: {
          'postDocument': await getDocumentParameter<PostsRecord>(
              data, 'postDocument', PostsRecord.fromSnapshot),
        },
      ),
  'PageRegisterAccountOrganization': ParameterData.none(),
  'PageUsersFollows': (data) async => ParameterData(
        allParams: {
          'userDoc': await getDocumentParameter<AllUsersRecord>(
              data, 'userDoc', AllUsersRecord.fromSnapshot),
        },
      ),
  'PageAddUsersToChat': (data) async => ParameterData(
        allParams: {
          'chatDocument': await getDocumentParameter<ChatsRecord>(
              data, 'chatDocument', ChatsRecord.fromSnapshot),
        },
      ),
  'PageChatOverview': ParameterData.none(),
  'PageUsersFollowers': (data) async => ParameterData(
        allParams: {
          'userDoc': await getDocumentParameter<AllUsersRecord>(
              data, 'userDoc', AllUsersRecord.fromSnapshot),
        },
      ),
  'PageCreateGroupChat': ParameterData.none(),
  'PageUsersMember': (data) async => ParameterData(
        allParams: {
          'userDoc': await getDocumentParameter<AllUsersRecord>(
              data, 'userDoc', AllUsersRecord.fromSnapshot),
        },
      ),
  'PageManageMembers': ParameterData.none(),
  'PageNotifications': ParameterData.none(),
  'PageSocialPostsFeed': ParameterData.none(),
  'PageEventList': ParameterData.none(),
  'PageEventOrganizationList': ParameterData.none(),
  'PageEventEdit': (data) async => ParameterData(
        allParams: {
          'documentEvent': await getDocumentParameter<EventsRecord>(
              data, 'documentEvent', EventsRecord.fromSnapshot),
        },
      ),
  'PageBroadcastDetailPage': (data) async => ParameterData(
        allParams: {
          'documentBroadcast': await getDocumentParameter<BroadcastsRecord>(
              data, 'documentBroadcast', BroadcastsRecord.fromSnapshot),
        },
      ),
  'PageBroadcastOverview': ParameterData.none(),
  'PageUserSearch': ParameterData.none(),
  'PageRegisterFlow': ParameterData.none(),
  'PageOrganizationCommunity': (data) async => ParameterData(
        allParams: {
          'userProfileDoc': await getDocumentParameter<AllUsersRecord>(
              data, 'userProfileDoc', AllUsersRecord.fromSnapshot),
        },
      ),
  'PageUserProfileCopy': (data) async => ParameterData(
        allParams: {
          'userProfileDoc': await getDocumentParameter<AllUsersRecord>(
              data, 'userProfileDoc', AllUsersRecord.fromSnapshot),
        },
      ),
  'ChatNew': (data) async => ParameterData(
        allParams: {
          'otherChatUser': await getDocumentParameter<AllUsersRecord>(
              data, 'otherChatUser', AllUsersRecord.fromSnapshot),
          'chatReference':
              getParameter<DocumentReference>(data, 'chatReference'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
