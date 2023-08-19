import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '../../auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : PageAuthenticationWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? NavBarPage()
              : PageAuthenticationWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomePage')
              : HomePageWidget(),
        ),
        FFRoute(
          name: 'PageAuthentication',
          path: '/pageAuthentication',
          builder: (context, params) => PageAuthenticationWidget(),
        ),
        FFRoute(
          name: 'PageRegisterAccount',
          path: '/pageRegisterAccount',
          builder: (context, params) => PageRegisterAccountWidget(),
        ),
        FFRoute(
          name: 'ChatPage',
          path: '/chatPage',
          asyncParams: {
            'chatUser': getDoc(['all_users'], AllUsersRecord.fromSnapshot),
            'chat': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => ChatPageWidget(
            chatUser: params.getParam('chatUser', ParamType.Document),
            chatRef: params.getParam(
                'chatRef', ParamType.DocumentReference, false, ['chats']),
            chat: params.getParam('chat', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PageAllUsers',
          path: '/pageAllUsers',
          builder: (context, params) => PageAllUsersWidget(),
        ),
        FFRoute(
          name: 'PageUserProfile',
          path: '/pageUserProfile',
          asyncParams: {
            'userProfileDoc':
                getDoc(['all_users'], AllUsersRecord.fromSnapshot),
          },
          builder: (context, params) => PageUserProfileWidget(
            userProfileDoc:
                params.getParam('userProfileDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PageUserProfileEdit',
          path: '/pageUserProfileEdit',
          requireAuth: true,
          asyncParams: {
            'myUserProfileDoc':
                getDoc(['all_users'], AllUsersRecord.fromSnapshot),
          },
          builder: (context, params) => PageUserProfileEditWidget(
            myUserProfileDoc:
                params.getParam('myUserProfileDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PageEventDetails',
          path: '/pageEventDetails',
          asyncParams: {
            'documentEvent': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => PageEventDetailsWidget(
            documentEvent: params.getParam('documentEvent', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PageSocialPostDetails',
          path: '/pageSocialPostDetails',
          asyncParams: {
            'postDocument': getDoc(['posts'], PostsRecord.fromSnapshot),
          },
          builder: (context, params) => PageSocialPostDetailsWidget(
            postDocument: params.getParam('postDocument', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PageSocialPosts',
          path: '/pageSocialPosts',
          builder: (context, params) => PageSocialPostsWidget(),
        ),
        FFRoute(
          name: 'PageRegisterAccountOrganization',
          path: '/pageRegisterAccountOrganization',
          builder: (context, params) => PageRegisterAccountOrganizationWidget(),
        ),
        FFRoute(
          name: 'PageUsersFollows',
          path: '/pageUsersFollows',
          asyncParams: {
            'userDoc': getDoc(['all_users'], AllUsersRecord.fromSnapshot),
            'userDocFollows': getDoc(
                ['all_users', 'user_follows'], UserFollowsRecord.fromSnapshot),
          },
          builder: (context, params) => PageUsersFollowsWidget(
            userDoc: params.getParam('userDoc', ParamType.Document),
            userDocFollows:
                params.getParam('userDocFollows', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PageEvents',
          path: '/pageEvents',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'PageEvents')
              : PageEventsWidget(),
        ),
        FFRoute(
          name: 'PageUserSearch',
          path: '/pageUserSearch',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'PageUserSearch')
              : PageUserSearchWidget(),
        ),
        FFRoute(
          name: 'PageAddUsersToChat',
          path: '/pageAddUsersToChat',
          asyncParams: {
            'chatDocument': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => PageAddUsersToChatWidget(
            chatDocument: params.getParam('chatDocument', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PageAllChats',
          path: '/pageAllChats',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'PageAllChats')
              : PageAllChatsWidget(),
        ),
        FFRoute(
          name: 'PageUsersFollowers',
          path: '/pageUsersFollowers',
          asyncParams: {
            'userDoc': getDoc(['all_users'], AllUsersRecord.fromSnapshot),
            'userDocFollowers': getDoc(['all_users', 'user_followers'],
                UserFollowersRecord.fromSnapshot),
          },
          builder: (context, params) => PageUsersFollowersWidget(
            userDoc: params.getParam('userDoc', ParamType.Document),
            userDocFollowers:
                params.getParam('userDocFollowers', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PageCreateGroupChat',
          path: '/pageCreateGroupChat',
          builder: (context, params) => PageCreateGroupChatWidget(),
        ),
        FFRoute(
          name: 'PageNotifications',
          path: '/pageNotifications',
          builder: (context, params) => PageNotificationsWidget(),
        ),
        FFRoute(
          name: 'PageUsersMember',
          path: '/pageUsersMember',
          asyncParams: {
            'userDoc': getDoc(['all_users'], AllUsersRecord.fromSnapshot),
            'userDocMembers': getDoc(
                ['all_users', 'user_members'], UserMembersRecord.fromSnapshot),
          },
          builder: (context, params) => PageUsersMemberWidget(
            userDoc: params.getParam('userDoc', ParamType.Document),
            userDocMembers:
                params.getParam('userDocMembers', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PageManageMembers',
          path: '/pageManageMembers',
          builder: (context, params) => PageManageMembersWidget(),
        ),
        FFRoute(
          name: 'PageOrgProfileEdit',
          path: '/pageOrgProfileEdit',
          requireAuth: true,
          asyncParams: {
            'myUserProfileDoc':
                getDoc(['all_users'], AllUsersRecord.fromSnapshot),
          },
          builder: (context, params) => PageOrgProfileEditWidget(
            myUserProfileDoc:
                params.getParam('myUserProfileDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'managemebr',
          path: '/managemebr',
          builder: (context, params) => ManagemebrWidget(),
        ),
        FFRoute(
          name: 'PageSocialPostsRecentPosts',
          path: '/pageSocialPostsRecentPosts',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'PageSocialPostsRecentPosts')
              : PageSocialPostsRecentPostsWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/pageAuthentication';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitThreeBounce(
                      color: Color(0xFFCF2E2E),
                      size: 50.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
