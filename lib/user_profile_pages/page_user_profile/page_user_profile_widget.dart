import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common_widgets/empty_list_widgets/comp_empty_page/comp_empty_page_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/organization_pages/comp_member_invitation_response/comp_member_invitation_response_widget.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'page_user_profile_model.dart';
export 'page_user_profile_model.dart';

class PageUserProfileWidget extends StatefulWidget {
  const PageUserProfileWidget({
    Key? key,
    this.userProfileDoc,
  }) : super(key: key);

  final AllUsersRecord? userProfileDoc;

  @override
  _PageUserProfileWidgetState createState() => _PageUserProfileWidgetState();
}

class _PageUserProfileWidgetState extends State<PageUserProfileWidget>
    with TickerProviderStateMixin {
  late PageUserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.2, 1.2),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageUserProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.actionOutputUserFollows = await queryUserFollowsRecordOnce(
        parent: widget.userProfileDoc?.reference,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (valueOrDefault<bool>(
        _model.actionOutputUserFollows!.userData
                .where((e) => valueOrDefault<bool>(
                      e.relationType == 'member',
                      false,
                    ))
                .toList()
                .length >=
            1,
        false,
      )) {
        setState(() {
          _model.showMemberOfContainer = true;
        });
      } else {
        setState(() {
          _model.showMemberOfContainer = false;
        });
      }

      unawaited(
        () async {
          _model.actionOutputUserFollowers = await queryUserFollowersRecordOnce(
            parent: widget.userProfileDoc?.reference,
            singleRecord: true,
          ).then((s) => s.firstOrNull);
        }(),
      );
      unawaited(
        () async {
          _model.actionOutputUserMembers = await queryUserMembersRecordOnce(
            parent: widget.userProfileDoc?.reference,
            singleRecord: true,
          ).then((s) => s.firstOrNull);
        }(),
      );
      setState(() {});
    });

    _model.expandableController = ExpandableController(initialExpanded: false);

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: GetUserRelationInformationCall.call(
        authenticatedUserId: currentUserReference?.id,
        profileUserId: widget.userProfileDoc?.reference.id,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: SpinKitChasingDots(
                  color: Color(0xFFCF2E2E),
                  size: 20.0,
                ),
              ),
            ),
          );
        }
        final pageUserProfileGetUserRelationInformationResponse =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 28.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Text(
                widget.userProfileDoc!.isOrganization
                    ? 'Vereins-Profil'
                    : 'Nutzer-Profil',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Hammersmith One',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.userProfileDoc?.displayName,
                                      'Unbekanntes Profil',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  borderRadius: BorderRadius.circular(0.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 160.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fitWidth,
                                            image: Image.network(
                                              valueOrDefault<String>(
                                                widget.userProfileDoc
                                                    ?.bannerImageUrl,
                                                '\"\"',
                                              ),
                                            ).image,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          gradient: LinearGradient(
                                            colors: [
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                              Colors.transparent
                                            ],
                                            stops: [0.0, 1.0],
                                            begin:
                                                AlignmentDirectional(1.0, -1.0),
                                            end:
                                                AlignmentDirectional(-1.0, 1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                    ),
                                    if (valueOrDefault<bool>(
                                      widget.userProfileDoc?.bannerImageUrl !=
                                              null &&
                                          widget.userProfileDoc
                                                  ?.bannerImageUrl !=
                                              '',
                                      false,
                                    ))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    widget.userProfileDoc!
                                                        .bannerImageUrl,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: widget.userProfileDoc!
                                                      .bannerImageUrl,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: widget
                                                .userProfileDoc!.bannerImageUrl,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.network(
                                                widget.userProfileDoc!
                                                    .bannerImageUrl,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 160.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Container(
                                        width: 150.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    valueOrDefault<String>(
                                                      widget.userProfileDoc
                                                          ?.photoUrl,
                                                      'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351928-stock-illustration-default-placeholder-man-and-woman.jpg',
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: valueOrDefault<String>(
                                                    widget.userProfileDoc
                                                        ?.photoUrl,
                                                    'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351928-stock-illustration-default-placeholder-man-and-woman.jpg',
                                                  ),
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: valueOrDefault<String>(
                                              widget.userProfileDoc?.photoUrl,
                                              'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351928-stock-illustration-default-placeholder-man-and-woman.jpg',
                                            ),
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(120.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  widget
                                                      .userProfileDoc?.photoUrl,
                                                  'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351928-stock-illustration-default-placeholder-man-and-woman.jpg',
                                                ),
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (GetUserRelationInformationCall
                                                  .isProfileOrg(
                                                pageUserProfileGetUserRelationInformationResponse
                                                    .jsonBody,
                                              ) ??
                                              true)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Icon(
                                                Icons.maps_home_work_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                            ),
                                          if (valueOrDefault<bool>(
                                            false == true,
                                            false,
                                          ))
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Icon(
                                                Icons.sports_martial_arts_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 24.0,
                                              ),
                                            ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    if (widget.userProfileDoc?.reference !=
                                        currentUserReference) {
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          if (!GetUserRelationInformationCall
                                                  .isFollowing(
                                                pageUserProfileGetUserRelationInformationResponse
                                                    .jsonBody,
                                              )! &&
                                              !GetUserRelationInformationCall
                                                  .isBlocked(
                                                pageUserProfileGetUserRelationInformationResponse
                                                    .jsonBody,
                                              )!)
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              icon: Icon(
                                                Icons.add_reaction,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                _model.followerUserResult =
                                                    await FollowUserCall.call(
                                                  authenticatedUserId:
                                                      currentUserReference?.id,
                                                  requestedUserId: widget
                                                      .userProfileDoc
                                                      ?.reference
                                                      .id,
                                                );
                                                if ((_model.followerUserResult
                                                        ?.succeeded ??
                                                    true)) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Du folgst diesem Nutzer ab sofort!',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Fehler. Du kannst diesem Nutzer nicht folgen.',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  );
                                                }

                                                setState(() {});

                                                setState(() {});
                                              },
                                            ),
                                          if (GetUserRelationInformationCall
                                                  .isFollowing(
                                                pageUserProfileGetUserRelationInformationResponse
                                                    .jsonBody,
                                              ) ??
                                              true)
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              icon: Icon(
                                                Icons.person_add_disabled_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Bist du sicher?'),
                                                              content: Text(
                                                                  'Möchtest du diesem user entfolgen?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Abbrechen'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Bestätigen'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                _model.unfollowUserResult =
                                                    await UnfollowUserCall.call(
                                                  authenticatedUserId:
                                                      currentUserUid,
                                                  requestedUserId: widget
                                                      .userProfileDoc?.uid,
                                                );
                                                if ((_model.unfollowUserResult
                                                        ?.succeeded ??
                                                    true)) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Du folgst diesem Nutzer ab sofort!',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Fehler. Du kannst diesem Nutzer nicht folgen.',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  );
                                                }

                                                setState(() {});

                                                setState(() {});
                                              },
                                            ),
                                          if (valueOrDefault<bool>(
                                            widget.userProfileDoc
                                                        ?.contactMail !=
                                                    null &&
                                                widget.userProfileDoc
                                                        ?.contactMail !=
                                                    '',
                                            false,
                                          ))
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              icon: Icon(
                                                Icons.mail,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                await launchUrl(Uri(
                                                    scheme: 'mailto',
                                                    path: widget.userProfileDoc!
                                                        .contactMail,
                                                    query: {
                                                      'subject':
                                                          '[myFightbase] Anfrage von ${currentUserDisplayName}',
                                                    }
                                                        .entries
                                                        .map((MapEntry<String,
                                                                    String>
                                                                e) =>
                                                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                        .join('&')));
                                              },
                                            ),
                                          if (valueOrDefault<bool>(
                                            widget.userProfileDoc
                                                        ?.contactPhoneNumber !=
                                                    null &&
                                                widget.userProfileDoc
                                                        ?.contactPhoneNumber !=
                                                    '',
                                            false,
                                          ))
                                            FlutterFlowIconButton(
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              icon: Icon(
                                                Icons.call,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                await launchUrl(Uri(
                                                  scheme: 'tel',
                                                  path: widget.userProfileDoc!
                                                      .contactPhoneNumber,
                                                ));
                                              },
                                            ),
                                          if (!GetUserRelationInformationCall
                                              .isBlocked(
                                            pageUserProfileGetUserRelationInformationResponse
                                                .jsonBody,
                                          )!)
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              icon: Icon(
                                                Icons.message,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'ChatNew',
                                                  queryParameters: {
                                                    'otherChatUser':
                                                        serializeParam(
                                                      widget.userProfileDoc,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'otherChatUser':
                                                        widget.userProfileDoc,
                                                  },
                                                );
                                              },
                                            ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                            icon: Icon(
                                              Icons.arrow_drop_down_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              setState(() {
                                                _model.showExtraMenu = true;
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                'PageUserProfileEdit');
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'dwfabmir' /* Dies ist dein eigenes Profil. ... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          if (GetUserRelationInformationCall.isAuthInvited(
                                pageUserProfileGetUserRelationInformationResponse
                                    .jsonBody,
                              ) ??
                              true)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 16.0, 8.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child:
                                                CompMemberInvitationResponseWidget(
                                              profileId:
                                                  widget.userProfileDoc!.uid,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 2.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        border: Border.all(
                                          color: valueOrDefault<Color>(
                                            _model.mouseRegionHovered!
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'r23eejbj' /* Einladung beantworten. */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.reply_all,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onEnter: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered = true);
                                            }),
                                            onExit: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered = false);
                                            }),
                                          ),
                                        ],
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation']!),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (GetUserRelationInformationCall.isBlocked(
                                pageUserProfileGetUserRelationInformationResponse
                                    .jsonBody,
                              ) ??
                              true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'nr1gpkvk' /* Dieser Nutzer hat dich blockie... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                            ),
                          if (_model.showMemberOfContainer)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                constraints: BoxConstraints(
                                  maxWidth: 500.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '52an3yge' /* Aktives Mitglied bei: */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                    minHeight: 50.0,
                                                    maxHeight: 108.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final userMemberOf = (_model
                                                                    .actionOutputUserFollows
                                                                    ?.userData
                                                                    ?.where((e) =>
                                                                        valueOrDefault<
                                                                            bool>(
                                                                          e.relationType ==
                                                                              'member',
                                                                          false,
                                                                        ))
                                                                    .toList()
                                                                    ?.toList() ??
                                                                [])
                                                            .take(3)
                                                            .toList();
                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              userMemberOf
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 8.0),
                                                          itemBuilder: (context,
                                                              userMemberOfIndex) {
                                                            final userMemberOfItem =
                                                                userMemberOf[
                                                                    userMemberOfIndex];
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Container(
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    _model.userProfileMemberOfOrganization =
                                                                        await AllUsersRecord.getDocumentOnce(
                                                                            userMemberOfItem.userDocRef!);
                                                                    if (Navigator.of(
                                                                            context)
                                                                        .canPop()) {
                                                                      context
                                                                          .pop();
                                                                    }
                                                                    context
                                                                        .pushNamed(
                                                                      'PageUserProfile',
                                                                      queryParameters:
                                                                          {
                                                                        'userProfileDoc':
                                                                            serializeParam(
                                                                          _model
                                                                              .userProfileMemberOfOrganization,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'userProfileDoc':
                                                                            _model.userProfileMemberOfOrganization,
                                                                      },
                                                                    );

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            32.0,
                                                                        height:
                                                                            32.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            userMemberOfItem.userAvatar,
                                                                            'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133351928-stock-illustration-default-placeholder-man-and-woman.jpg',
                                                                          ),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              2.0,
                                                                              4.0,
                                                                              2.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              userMemberOfItem.userDisplayName,
                                                                              'Unbekannter Verein',
                                                                            ).maybeHandleOverflow(
                                                                              maxChars: 30,
                                                                              replacement: '…',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                1,
                                                                            style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ]
                                                                        .divide(SizedBox(
                                                                            width:
                                                                                8.0))
                                                                        .addToStart(SizedBox(
                                                                            width:
                                                                                8.0))
                                                                        .addToEnd(SizedBox(
                                                                            width:
                                                                                8.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              constraints: BoxConstraints(
                                maxWidth: 500.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 4.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.25,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'PageUsersFollows',
                                                    queryParameters: {
                                                      'userDoc': serializeParam(
                                                        widget.userProfileDoc,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'userDoc':
                                                          widget.userProfileDoc,
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'hohytcot' /* Folgt */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          _model
                                                              .actionOutputUserFollows
                                                              ?.userData
                                                              ?.length
                                                              ?.toString(),
                                                          '0',
                                                        ).maybeHandleOverflow(
                                                            maxChars: 6),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 4.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.25,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'PageUsersFollowers',
                                                    queryParameters: {
                                                      'userDoc': serializeParam(
                                                        widget.userProfileDoc,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'userDoc':
                                                          widget.userProfileDoc,
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'xs7iy3ye' /* Gefolgt */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          _model
                                                              .actionOutputUserFollowers
                                                              ?.userData
                                                              ?.length
                                                              ?.toString(),
                                                          '0',
                                                        ).maybeHandleOverflow(
                                                            maxChars: 6),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (widget
                                              .userProfileDoc?.isOrganization ??
                                          true)
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.25,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 8.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'PageUsersMember',
                                                      queryParameters: {
                                                        'userDoc':
                                                            serializeParam(
                                                          widget.userProfileDoc,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'userDoc': widget
                                                            .userProfileDoc,
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'aa5jrcyt' /* Mitglieder */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .actionOutputUserMembers
                                                                ?.userData
                                                                ?.length
                                                                ?.toString(),
                                                            '0',
                                                          ).maybeHandleOverflow(
                                                              maxChars: 6),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (!GetUserRelationInformationCall.isProfileOrg(
                            pageUserProfileGetUserRelationInformationResponse
                                .jsonBody,
                          )!)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                constraints: BoxConstraints(
                                  maxWidth: 500.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '0kznqip2' /* Kampfstatistiken */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            if (valueOrDefault<bool>(
                                              widget.userProfileDoc
                                                          ?.statisticsSportsType !=
                                                      null &&
                                                  widget.userProfileDoc
                                                          ?.statisticsSportsType !=
                                                      '',
                                              false,
                                            ))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .sports_martial_arts_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          widget.userProfileDoc!
                                                              .statisticsSportsType,
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            if (valueOrDefault<bool>(
                                              widget.userProfileDoc
                                                          ?.statisticsWeightClass !=
                                                      null &&
                                                  widget.userProfileDoc
                                                          ?.statisticsWeightClass !=
                                                      '',
                                              false,
                                            ))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      widget.userProfileDoc!
                                                          .statisticsWeightClass,
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (widget.userProfileDoc!
                                                    .statisticsHeight >
                                                0.0)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 100.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        widget.userProfileDoc
                                                            ?.statisticsHeight
                                                            ?.toString(),
                                                        '--',
                                                      )} cm'
                                                          .maybeHandleOverflow(
                                                              maxChars: 8),
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (widget.userProfileDoc!
                                                    .statisticsHeight >
                                                0.0)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 100.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        widget.userProfileDoc
                                                            ?.statisticsWeight
                                                            ?.toString(),
                                                        '--',
                                                      )} kg'
                                                          .maybeHandleOverflow(
                                                              maxChars: 8),
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'n6wm9hqb' /* Kämpfe Ingesamt */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Text(
                                                        (valueOrDefault<int>(
                                                                  widget
                                                                      .userProfileDoc
                                                                      ?.statisticsFightWins,
                                                                  0,
                                                                ) +
                                                                valueOrDefault<
                                                                    int>(
                                                                  widget
                                                                      .userProfileDoc
                                                                      ?.statisticsFightLost,
                                                                  0,
                                                                ) +
                                                                valueOrDefault<
                                                                    int>(
                                                                  widget
                                                                      .userProfileDoc
                                                                      ?.statisticsFightDraw,
                                                                  0,
                                                                ))
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.25,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(4.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'a6f9g37c' /* Gewonnen */,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          widget
                                                                              .userProfileDoc
                                                                              ?.statisticsFightWins
                                                                              ?.toString(),
                                                                          '--',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 14.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 40.0,
                                                              child:
                                                                  VerticalDivider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.25,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(4.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '8mnvh5lq' /* Verloren */,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 12.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          widget
                                                                              .userProfileDoc
                                                                              ?.statisticsFightLost
                                                                              ?.toString(),
                                                                          '--',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 14.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 40.0,
                                                              child:
                                                                  VerticalDivider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.25,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(4.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '775aesnx' /* Unentschieden */,
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 12.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              valueOrDefault(currentUserDocument?.statisticsFightDraw, 0).toString(),
                                                                              '--',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            maxLines:
                                                                                1,
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 14.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                            ),
                          if (GetUserRelationInformationCall.isProfileOrg(
                                pageUserProfileGetUserRelationInformationResponse
                                    .jsonBody,
                              ) ??
                              true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                constraints: BoxConstraints(
                                  maxWidth: 500.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'vowz4f3l' /* Über Mich */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.userProfileDoc?.aboutMe,
                                            ' ---',
                                          ).maybeHandleOverflow(maxChars: 500),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      if (GetUserRelationInformationCall
                                              .isProfileOrg(
                                            pageUserProfileGetUserRelationInformationResponse
                                                .jsonBody,
                                          ) ??
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    'https://images.unsplash.com/photo-1584972191378-d70853fc47fc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxnb29nbGUlMjBtYXBzfGVufDB8fHx8MTcwMDE0NjQ1MXww&ixlib=rb-4.0.3&q=80&w=1080',
                                                    width: 120.0,
                                                    height: 120.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'jryciqwa' /* Kontakt: */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.phone_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            widget
                                                                .userProfileDoc
                                                                ?.contactPhoneNumber,
                                                            'Telefonnummer: --',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.mail,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            widget
                                                                .userProfileDoc
                                                                ?.contactMail,
                                                            'Telefonnummer: --',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.my_location,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            widget
                                                                .userProfileDoc
                                                                ?.contactAdressStreet,
                                                            'Straße: --',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.my_location,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          size: 20.0,
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            widget
                                                                .userProfileDoc
                                                                ?.contactAdressPostalCode,
                                                            'PLZ: --',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.location_city,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            widget
                                                                .userProfileDoc
                                                                ?.contactAdressCity,
                                                            'Ort: --',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              child: Container(
                                color: Color(0x00000000),
                                child: ExpandableNotifier(
                                  controller: _model.expandableController,
                                  child: ExpandablePanel(
                                    header: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Icon(
                                              Icons
                                                  .sports_martial_arts_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'zrzibrcv' /* Galerie */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    collapsed: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    expanded: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(),
                                              child: Builder(
                                                builder: (context) {
                                                  final recentPostsListGallery =
                                                      (widget.userProfileDoc
                                                                  ?.recentPosts
                                                                  ?.toList() ??
                                                              [])
                                                          .take(25)
                                                          .toList();
                                                  if (recentPostsListGallery
                                                      .isEmpty) {
                                                    return Container(
                                                      height: 20.0,
                                                      child:
                                                          CompEmptyPageWidget(),
                                                    );
                                                  }
                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.0),
                                                    primary: false,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        recentPostsListGallery
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(width: 8.0),
                                                    itemBuilder: (context,
                                                        recentPostsListGalleryIndex) {
                                                      final recentPostsListGalleryItem =
                                                          recentPostsListGallery[
                                                              recentPostsListGalleryIndex];
                                                      return StreamBuilder<
                                                          PostsRecord>(
                                                        stream: PostsRecord
                                                            .getDocument(
                                                                recentPostsListGalleryItem
                                                                    .postID!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 20.0,
                                                                height: 20.0,
                                                                child:
                                                                    SpinKitChasingDots(
                                                                  color: Color(
                                                                      0xFFCF2E2E),
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final containerPostsRecord =
                                                              snapshot.data!;
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Visibility(
                                                              visible: containerPostsRecord
                                                                          .postPhoto !=
                                                                      null &&
                                                                  containerPostsRecord
                                                                          .postPhoto !=
                                                                      '',
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          FlutterFlowExpandedImageView(
                                                                        image: Image
                                                                            .network(
                                                                          containerPostsRecord
                                                                              .postPhoto,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                        allowRotation:
                                                                            false,
                                                                        tag: containerPostsRecord
                                                                            .postPhoto,
                                                                        useHeroAnimation:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Hero(
                                                                  tag: containerPostsRecord
                                                                      .postPhoto,
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      containerPostsRecord
                                                                          .postPhoto,
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    theme: ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: false,
                                      tapBodyToCollapse: false,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      hasIcon: true,
                                      expandIcon: Icons.arrow_left_sharp,
                                      collapseIcon: Icons.arrow_drop_down,
                                      iconColor:
                                          FlutterFlowTheme.of(context).accent4,
                                      iconPadding: EdgeInsets.fromLTRB(
                                          0.0, 8.0, 16.0, 0.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 8.0))
                            .addToEnd(SizedBox(height: 8.0)),
                      ),
                    ),
                  ),
                  if (_model.showExtraMenu)
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            _model.showExtraMenu = false;
                          });
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xEC9E9E9E),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Wrap(
                                    spacing: 8.0,
                                    runSpacing: 4.0,
                                    alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.vertical,
                                    runAlignment: WrapAlignment.center,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      if (!GetUserRelationInformationCall
                                          .isBlocking(
                                        pageUserProfileGetUserRelationInformationResponse
                                            .jsonBody,
                                      )!)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              icon: Icon(
                                                Icons.lock_person_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                              showLoadingIndicator: true,
                                              onPressed: () async {
                                                _model.blockUserResult =
                                                    await BlockUserCall.call(
                                                  authenticatedUserId:
                                                      currentUserUid,
                                                  requestedUserId: widget
                                                      .userProfileDoc?.uid,
                                                );
                                                if ((_model.blockUserResult
                                                        ?.succeeded ??
                                                    true)) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Du hast diesen Nutzer nun blockiert.',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Fehler. Du hast kannst diesen Nutzer nicht blockieren.',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  );
                                                }

                                                setState(() {});

                                                setState(() {});
                                              },
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                's88lwp62' /* Diesen Nutzer blockieren */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      if (GetUserRelationInformationCall
                                              .isBlocking(
                                            pageUserProfileGetUserRelationInformationResponse
                                                .jsonBody,
                                          ) ??
                                          true)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              icon: Icon(
                                                Icons.lock_open_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                              showLoadingIndicator: true,
                                              onPressed: () async {
                                                _model.unblockUserResult =
                                                    await UnblockUserCall.call(
                                                  authenticatedUserId:
                                                      currentUserUid,
                                                  requestedUserId: widget
                                                      .userProfileDoc?.uid,
                                                );
                                                if ((_model.unblockUserResult
                                                        ?.succeeded ??
                                                    true)) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Du hast diesen Nutzer entblockt.',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Fehler. Du hast kannst diesen Nutzer nicht entblocken.',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  );
                                                }

                                                setState(() {});

                                                setState(() {});
                                              },
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'fh28zluv' /* Nutzer nicht mehr blocken */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      if (valueOrDefault<bool>(
                                        valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.isOrganization,
                                                false) &&
                                            GetUserRelationInformationCall
                                                .isAuthMember(
                                              pageUserProfileGetUserRelationInformationResponse
                                                  .jsonBody,
                                            )!,
                                        false,
                                      ))
                                        AuthUserStreamWidget(
                                          builder: (context) => Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                icon: Icon(
                                                  Icons.follow_the_signs_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                                showLoadingIndicator: true,
                                                onPressed: () async {
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Bist du sicher?'),
                                                                content: Text(
                                                                    'Möchtest du diesen Verein wirklich verlassen?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Abbrechen'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Bestätigen'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    _model.leaveOrganizationResult =
                                                        await LeaveOrganizationCall
                                                            .call(
                                                      authUserId:
                                                          currentUserUid,
                                                      profileId: widget
                                                          .userProfileDoc
                                                          ?.reference
                                                          .id,
                                                    );
                                                    if ((_model
                                                            .leaveOrganizationResult
                                                            ?.succeeded ??
                                                        true)) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Du hast den Verein verlassen.',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
                                                        ),
                                                      );
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Tut uns leid, etwas ist schief gelaufen.',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
                                                        ),
                                                      );
                                                    }

                                                    setState(() {});
                                                  }

                                                  setState(() {});
                                                },
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'vbyl35mj' /* Verein verlassen */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      if (valueOrDefault<bool>(
                                        valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.isOrganization,
                                                false) &&
                                            GetUserRelationInformationCall
                                                .isProfileInvited(
                                              pageUserProfileGetUserRelationInformationResponse
                                                  .jsonBody,
                                            )!,
                                        false,
                                      ))
                                        AuthUserStreamWidget(
                                          builder: (context) => Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                icon: Icon(
                                                  Icons.back_hand_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  if (valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.isOrganization,
                                                      false)) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Bist du sicher?'),
                                                                  content: Text(
                                                                      'Möchtest du diese Einladung wirklich zurückziehen?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Abbrechen'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Einladung zurückziehen'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      _model.withdrawOrganizationInviteResult =
                                                          await WithdrawOrganizationInviteCall
                                                              .call(
                                                        authenticatedUserId:
                                                            currentUserReference
                                                                ?.id,
                                                        requestedUserId: widget
                                                            .userProfileDoc
                                                            ?.reference
                                                            .id,
                                                      );
                                                      if ((_model
                                                              .withdrawOrganizationInviteResult
                                                              ?.succeeded ??
                                                          true)) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Du hast den Nutzer in deinen Verein eingeladen.',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                          ),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Sorry. Etwas ist schief gelaufen.',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      }
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Du bist keine Organisation und darfst keine Personen in deinen Verein einladen.',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  }

                                                  setState(() {});

                                                  setState(() {});
                                                },
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5szywwj7' /* Vereinseinladung zurückziehen */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      if (valueOrDefault<bool>(
                                        valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.isOrganization,
                                                false) &&
                                            !GetUserRelationInformationCall
                                                .isProfileMember(
                                              pageUserProfileGetUserRelationInformationResponse
                                                  .jsonBody,
                                            )! &&
                                            !GetUserRelationInformationCall
                                                .isProfileInvited(
                                              pageUserProfileGetUserRelationInformationResponse
                                                  .jsonBody,
                                            )! &&
                                            !GetUserRelationInformationCall
                                                .isBlocked(
                                              pageUserProfileGetUserRelationInformationResponse
                                                  .jsonBody,
                                            )!,
                                        false,
                                      ))
                                        AuthUserStreamWidget(
                                          builder: (context) => Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                icon: Icon(
                                                  Icons.add_home_work_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  if (valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.isOrganization,
                                                      false)) {
                                                    _model.inviteUserToOrganizationResult =
                                                        await InviteUserToOrganizationCall
                                                            .call(
                                                      authenticatedUserId:
                                                          currentUserUid,
                                                      requestedUserId: widget
                                                          .userProfileDoc?.uid,
                                                    );
                                                    if ((_model
                                                            .inviteUserToOrganizationResult
                                                            ?.succeeded ??
                                                        true)) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Du hast den Nutzer in deinen Verein eingeladen.',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent2,
                                                        ),
                                                      );
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Sorry. Etwas ist schief gelaufen.',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Du bist keine Organisation und darfst keine Personen in deinen Verein einladen.',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  }

                                                  setState(() {});

                                                  setState(() {});
                                                },
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'n019e907' /* Zum Verein einladen */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      if (valueOrDefault<bool>(
                                        valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.isOrganization,
                                                false) &&
                                            GetUserRelationInformationCall
                                                .isProfileMember(
                                              pageUserProfileGetUserRelationInformationResponse
                                                  .jsonBody,
                                            )!,
                                        false,
                                      ))
                                        AuthUserStreamWidget(
                                          builder: (context) => Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                icon: Icon(
                                                  Icons
                                                      .domain_disabled_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  if (valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.isOrganization,
                                                      false)) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Nutzer entfernen'),
                                                                  content: Text(
                                                                      'Möchtest du diesen Nutzer wirklich aus deinem Verein entfernen?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Abbrechen'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Bestätigen'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      _model.removeFromOrganizationResult =
                                                          await RemoveUserFromOrganizationCall
                                                              .call(
                                                        authenticatedUserId:
                                                            currentUserUid,
                                                        requestedUserId: widget
                                                            .userProfileDoc
                                                            ?.uid,
                                                      );
                                                      if ((_model
                                                              .removeFromOrganizationResult
                                                              ?.succeeded ??
                                                          true)) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Du hast den Nutzer entfernt.',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                          ),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Tut uns leid, etwas ist schief gelaufen.',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                          ),
                                                        );
                                                      }

                                                      setState(() {});
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Tut uns leid, etwas ist schief gelaufen.',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  's7pihf16' /* Aus dem Verein entfernen */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
