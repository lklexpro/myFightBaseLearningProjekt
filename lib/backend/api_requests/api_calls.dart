import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'getUserRelationInformation';

/// Start Algolia HTTP API Group Code

class AlgoliaHTTPAPIGroup {
  static String baseUrl = 'https://[Application-ID]-dsn.algolia.net/1';
  static Map<String, String> headers = {
    'X-Algolia-Application-Id': 'TQ3UYR8SWC',
    'X-Algolia-API-Key': '616541e7a6cd065e02b716cea3433f39',
  };
  static SearchFacetValuesCall searchFacetValuesCall = SearchFacetValuesCall();
  static SearchIndexCall searchIndexCall = SearchIndexCall();
}

class SearchFacetValuesCall {
  Future<ApiCallResponse> call({
    String? indexName = '',
    String? facetName = '',
    String? params = '',
    String? facetQuery = '',
    int? maxFacetHits,
    String? applicationID = 'TQ3UYR8SWC',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Facet Values',
      apiUrl:
          '${AlgoliaHTTPAPIGroup.baseUrl}/indexes/${indexName}/facets/${facetName}/query',
      callType: ApiCallType.POST,
      headers: {
        'X-Algolia-Application-Id': 'TQ3UYR8SWC',
        'X-Algolia-API-Key': '616541e7a6cd065e02b716cea3433f39',
      },
      params: {
        'params': params,
        'facetQuery': facetQuery,
        'maxFacetHits': maxFacetHits,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchIndexCall {
  Future<ApiCallResponse> call({
    String? indexName = '',
    String? facetName = '',
    String? params = '',
    String? facetQuery = '',
    int? maxFacetHits,
    String? applicationID = 'TQ3UYR8SWC',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Index',
      apiUrl:
          '${AlgoliaHTTPAPIGroup.baseUrl}/indexes/${indexName}/facets/${facetName}/query',
      callType: ApiCallType.POST,
      headers: {
        'X-Algolia-Application-Id': 'TQ3UYR8SWC',
        'X-Algolia-API-Key': '616541e7a6cd065e02b716cea3433f39',
      },
      params: {
        'params': params,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Algolia HTTP API Group Code

class CreateSocialPostTimelineCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'createSocialPostTimeline',
      apiUrl: 'https://createtimeline-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserRelationInformationCall {
  static Future<ApiCallResponse> call({
    String? authenticatedUserId = '',
    String? profileUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserRelationInformation',
      apiUrl: 'https://getuserinformation-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'authenticatedUserId': authenticatedUserId,
        'profileId': profileUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? isFollowing(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.isFollowing''',
      ));
  static bool? isFollowed(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.isFollowed''',
      ));
  static bool? isAuthMember(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.isAuthMember''',
      ));
  static bool? isProfileMember(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.data.isProfileMember''',
      ));
  static bool? isProfileOrg(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.isProfileOrg''',
      ));
  static bool? isBlocking(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.isBlocking''',
      ));
  static bool? isBlocked(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.isBlocked''',
      ));
  static bool? isAuthInvited(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.isAuthInvited''',
      ));
  static bool? isProfileInvited(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.data.isProfileInvited''',
      ));
}

class GetRssFeedAsJSONtestCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getRssFeedAsJSONtest',
      apiUrl:
          'https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.boxingnews24.com%2Ffeed%2F',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? feedStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? feedImage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.feed.image''',
      ));
  static List<String>? itemTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? itemPubDate(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].pubDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FollowUserCall {
  static Future<ApiCallResponse> call({
    String? authenticatedUserId = '',
    String? requestedUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'followUser',
      apiUrl: 'https://followuser-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'authenticatedUserId': authenticatedUserId,
        'requestedUserId': requestedUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UnfollowUserCall {
  static Future<ApiCallResponse> call({
    String? authenticatedUserId = '',
    String? requestedUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'unfollowUser',
      apiUrl: 'https://unfollowuser-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'authenticatedUserId': authenticatedUserId,
        'requestedUserId': requestedUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BlockUserCall {
  static Future<ApiCallResponse> call({
    String? authenticatedUserId = '',
    String? requestedUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'blockUser',
      apiUrl: 'https://blockuser-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'authenticatedUserId': authenticatedUserId,
        'requestedUserId': requestedUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UnblockUserCall {
  static Future<ApiCallResponse> call({
    String? authenticatedUserId = '',
    String? requestedUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'unblockUser',
      apiUrl: 'https://unblockuser-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'authenticatedUserId': authenticatedUserId,
        'requestedUserId': requestedUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class InviteUserToOrganizationCall {
  static Future<ApiCallResponse> call({
    String? authenticatedUserId = '',
    String? requestedUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'inviteUserToOrganization',
      apiUrl: 'https://invitetoorganization-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'authenticatedUserId': authenticatedUserId,
        'requestedUserId': requestedUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class NotificationActionCall {
  static Future<ApiCallResponse> call({
    String? notificationRef = '',
    String? authUserRef = '',
    String? userRes = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'notificationAction',
      apiUrl: 'https://notificationaction-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'authUserRef': authUserRef,
        'notificationRef': notificationRef,
        'userRes': userRes,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SocialPostReactionCall {
  static Future<ApiCallResponse> call({
    String? postId = '',
    String? commentId = '',
    String? docType = '',
    String? authUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'socialPostReaction',
      apiUrl: 'https://socialpostreaction-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'postId': postId,
        'commentId': commentId,
        'docType': docType,
        'authUserId': authUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AcceptOrganizationInviteCall {
  static Future<ApiCallResponse> call({
    String? authenticatedUserId = '',
    String? profileId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'acceptOrganizationInvite',
      apiUrl: 'https://acceptorganizationinvite-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'authenticatedUserId': authenticatedUserId,
        'profileId': profileId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeclineOrganizationInviteCall {
  static Future<ApiCallResponse> call({
    String? authenticatedUserId = '',
    String? profileId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'declineOrganizationInvite',
      apiUrl: 'https://declineorganizationinvite-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'authenticatedUserId': authenticatedUserId,
        'profileId': profileId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class WithdrawOrganizationInviteCall {
  static Future<ApiCallResponse> call({
    String? authenticatedUserId = '',
    String? requestedUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'withdrawOrganizationInvite',
      apiUrl: 'https://withdraworganizationinvite-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'authenticatedUserId': authenticatedUserId,
        'requestedUserId': requestedUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class InviteSingleUserToEventCall {
  static Future<ApiCallResponse> call({
    String? invitedUserId = '',
    String? eventId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'inviteSingleUserToEvent',
      apiUrl: 'https://invitetoevent-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'invitedUserId': invitedUserId,
        'eventId': eventId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AcceptEventInviteCall {
  static Future<ApiCallResponse> call({
    String? eventId = '',
    String? authenticatedUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'acceptEventInvite',
      apiUrl: 'https://accepteventinvite-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'eventId': eventId,
        'authenticatedUserId': authenticatedUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeclineEventInviteCall {
  static Future<ApiCallResponse> call({
    String? eventId = '',
    String? authenticatedUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'declineEventInvite',
      apiUrl: 'https://declineeventinvite-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'eventId': eventId,
        'authenticatedUserId': authenticatedUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class PostponeEventInviteCall {
  static Future<ApiCallResponse> call({
    String? eventId = '',
    String? authenticatedUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'postponeEventInvite',
      apiUrl: 'https://postponeeventinvite-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'eventId': eventId,
        'authenticatedUserId': authenticatedUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class InviteToEventCall {
  static Future<ApiCallResponse> call({
    List<String>? userListList,
    String? eventId = '',
  }) async {
    final userList = _serializeList(userListList);

    final ffApiRequestBody = '''
{
  "userList": ${userList},
  "eventId": "${eventId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'inviteToEvent',
      apiUrl: 'https://invitetoevent-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class PublicEventEnrollCall {
  static Future<ApiCallResponse> call({
    String? eventId = '',
    String? authenticatedUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'publicEventEnroll',
      apiUrl: 'https://publiceventenroll-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'eventId': eventId,
        'authenticatedUserId': authenticatedUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class PublicEventDisenrollCall {
  static Future<ApiCallResponse> call({
    String? eventId = '',
    String? authenticatedUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'publicEventDisenroll',
      apiUrl: 'https://publiceventdisenroll-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'eventId': eventId,
        'authenticatedUserId': authenticatedUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class LeaveOrganizationCall {
  static Future<ApiCallResponse> call({
    String? authUserId = '',
    String? profileId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'leaveOrganization',
      apiUrl: 'https://leaveorganization-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'authenticatedUserId': authUserId,
        'requestedUserId': profileId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveUserFromOrganizationCall {
  static Future<ApiCallResponse> call({
    String? authenticatedUserId = '',
    String? requestedUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'removeUserFromOrganization',
      apiUrl: 'https://removeuserfromorganization-5hhhwtdo6a-ey.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'authenticatedUserId': authenticatedUserId,
        'requestedUserId': requestedUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
