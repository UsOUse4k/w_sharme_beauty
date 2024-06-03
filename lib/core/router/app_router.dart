import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/sub_pages/advert_add_service_page.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/sub_pages/advert_create_advert_page.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/sub_pages/advert_detail_page.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/sub_pages/advert_edit_page.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/sub_pages/advert_my_adverts_page.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/sub_pages/advert_product_and_service_page.dart';
import 'package:w_sharme_beauty/features/app/widgets/app.dart';
import 'package:w_sharme_beauty/features/auth/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/chat/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/chat/presentation/pages/sub_pages/sub_pages.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/pages/chat_group_messages_page.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/pages/sub_pages/sub_pages.dart';
import 'package:w_sharme_beauty/features/communities/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/communities/presentation/pages/sub_pages/community_post_detail_page.dart';
import 'package:w_sharme_beauty/features/communities/presentation/pages/sub_pages/create_a_community_page.dart';
import 'package:w_sharme_beauty/features/communities/presentation/pages/sub_pages/sub_pages.dart';
import 'package:w_sharme_beauty/features/home/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/home/presentation/pages/sub_pages/sub_pages.dart';
import 'package:w_sharme_beauty/features/main/presentation/pages/main_page.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/sub_pages/follower_subscribe_profile_page.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/sub_pages/followers_users_page.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/sub_pages/profile_date_page.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/sub_pages/profile_phone_page.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/sub_pages/sub_pages.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/sub_pages/subscriptions_users_page.dart';
import 'package:w_sharme_beauty/features/question/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/question/presentation/pages/sub_pages/sub_pages.dart';

mixin AppRouter on State<App> {
  final GoRouter _router = GoRouter(
    navigatorKey: RouterKeys.rootKey,
    debugLogDiagnostics: true,
    //initialLocation: RouterContants.login,
    redirect: (BuildContext context, GoRouterState state) {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;
      final goingToLoginPage = state.matchedLocation == RouterContants.login;
      final isGoingToRegisterPage =
          state.matchedLocation == RouterContants.register;
      final isGoingToResetPasswordPage =
          state.matchedLocation == RouterContants.reset;
      if (!isLoggedIn &&
          !goingToLoginPage &&
          !isGoingToRegisterPage &&
          !isGoingToResetPasswordPage) return RouterContants.login;
      if (isLoggedIn &&
          (goingToLoginPage ||
              isGoingToRegisterPage ||
              isGoingToResetPasswordPage)) return RouterContants.home;
      return null;
    },
    routes: [
      GoRoute(
        name: RouterContants.login,
        path: RouterContants.login,
        builder: (context, state) => const AuthorizationPage(),
      ),
      GoRoute(
        name: RouterContants.register,
        path: RouterContants.register,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        name: RouterContants.confirmRegister,
        path: RouterContants.confirmRegister,
        builder: (context, state) => const ConfirmationOfRegistrationPage(),
      ),
      GoRoute(
        name: RouterContants.profileDataAuth,
        path: RouterContants.profileDataAuth,
        builder: (context, state) => const ProfileDataAuthPage(),
      ),
      GoRoute(
        name: RouterContants.confirmPassword,
        path: RouterContants.confirmPassword,
        builder: (context, state) => const ConfirmPasswordReset(),
      ),
      GoRoute(
        name: RouterContants.newPassword,
        path: RouterContants.newPassword,
        builder: (context, state) => const NewPasswordPage(),
      ),
      GoRoute(
        name: RouterContants.reset,
        path: RouterContants.reset,
        builder: (context, state) => const PasswordResetPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainPage(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: RouterKeys.homeKey,
            routes: [
              GoRoute(
                name: RouterContants.home,
                path: RouterContants.home,
                builder: (context, state) => const HomePage(),
                routes: [
                  GoRoute(
                    path: '${RouterContants.post}/:postId',
                    builder: (BuildContext context, GoRouterState state) {
                      final postId = state.pathParameters['postId'];
                      return HomePostPage(
                        postId: postId,
                      );
                    },
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: "${RouterContants.profilePersonPage}/:authorId",
                    builder: (BuildContext context, GoRouterState state) {
                      final authorId = state.pathParameters['authorId'];
                      return ProfilePersonPage(authorId: authorId.toString());
                    },
                    routes: [
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: '${RouterContants.post}/:postId',
                        builder: (BuildContext context, GoRouterState state) {
                          final postId = state.pathParameters['postId'];
                          return HomePostPage(
                            postId: postId,
                          );
                        },
                      ),
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: 'subscriptions/:userId',
                        builder: (BuildContext context, GoRouterState state) {
                          final userId = state.pathParameters['userId'];
                          return SubscriptionsUsersPage(
                            userId: userId.toString(),
                          );
                        },
                      ),
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: 'followers/:userId',
                        builder: (BuildContext context, GoRouterState state) {
                          final userId = state.pathParameters['userId'];
                          return FollowersUsersPage(
                            userId: userId.toString(),
                          );
                        },
                        routes: [
                          GoRoute(
                            parentNavigatorKey: RouterKeys.rootKey,
                            path:
                                "${RouterContants.profilePersonPage}/:authorId",
                            builder:
                                (BuildContext context, GoRouterState state) {
                              final authorId = state.pathParameters['authorId'];
                              return ProfilePersonPage(
                                authorId: authorId.toString(),
                              );
                            },
                          ),
                        ],
                      ),
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: '${RouterContants.chatMessages}/:userId',
                        builder: (BuildContext context, GoRouterState state) {
                          final userId = state.pathParameters['userId'];
                          return ChatMessagesPage(
                            userId: userId,
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: RouterContants.homeNotification,
                    builder: (context, state) => const HomeNotificationPage(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: "${RouterContants.profilePersonPage}/:authorId",
                        builder: (BuildContext context, GoRouterState state) {
                          final authorId = state.pathParameters['authorId'];
                          return ProfilePersonPage(
                            authorId: authorId.toString(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: RouterContants.chat,
                    builder: (context, state) => const ChatPage(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: "${RouterContants.chatMessages}/:userId",
                        builder: (BuildContext context, GoRouterState state) {
                          final userId = state.pathParameters['userId'];
                          return ChatMessagesPage(userId: userId);
                        },
                        routes: [
                          GoRoute(
                            parentNavigatorKey: RouterKeys.rootKey,
                            path:
                                "${RouterContants.profilePersonPage}/:authorId",
                            builder:
                                (BuildContext context, GoRouterState state) {
                              final authorId = state.pathParameters['authorId'];
                              return ProfilePersonPage(
                                authorId: authorId.toString(),
                              );
                            },
                            routes: [
                              GoRoute(
                                parentNavigatorKey: RouterKeys.rootKey,
                                path: '${RouterContants.post}/:postId',
                                builder: (
                                  BuildContext context,
                                  GoRouterState state,
                                ) {
                                  final postId = state.pathParameters['postId'];
                                  return HomePostPage(
                                    postId: postId,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path:
                            '${RouterContants.chatGroupMessages}/:groupId/:communityId',
                        builder: (BuildContext context, GoRouterState state) {
                          final groupId = state.pathParameters['groupId'];
                          final communityId =
                              state.pathParameters['communityId'];
                          return ChatGroupMessagesPage(
                            groupId: groupId.toString(),
                            communityId: communityId.toString(),
                          );
                        },
                        routes: [
                          GoRoute(
                            parentNavigatorKey: RouterKeys.rootKey,
                            path: 'chatGroupEdit/:groupId/:communityId',
                            builder:
                                (BuildContext context, GoRouterState state) {
                              final groupId = state.pathParameters['groupId'];
                              final communityId =
                                  state.pathParameters['communityId'];
                              return ChatGroupEditPage(
                                groupId: groupId.toString(),
                                communityId: communityId.toString(),
                              );
                            },
                          ),
                          GoRoute(
                            parentNavigatorKey: RouterKeys.rootKey,
                            path: 'chatAdmins/:groupId/:communityId',
                            builder:
                                (BuildContext context, GoRouterState state) {
                              final groupId = state.pathParameters['groupId'];
                              final communityId =
                                  state.pathParameters['communityId'];

                              return ChatGroupAdminsPage(
                                groupId: groupId.toString(),
                                communityId: communityId.toString(),
                              );
                            },
                            routes: [
                              GoRoute(
                                parentNavigatorKey: RouterKeys.rootKey,
                                path:
                                    'appointManagment/:userId/:groupId/:communityId',
                                builder: (
                                  BuildContext context,
                                  GoRouterState state,
                                ) {
                                  final userId = state.pathParameters['userId'];
                                  final communityId =
                                      state.pathParameters['communityId'];
                                  final groupId =
                                      state.pathParameters['groupId'];
                                  return ChatGroupAppointManagmentPage(
                                    userId: userId.toString(),
                                    groupId: groupId.toString(),
                                    communityId: communityId.toString(),
                                  );
                                },
                              ),
                            ],
                          ),
                          GoRoute(
                            parentNavigatorKey: RouterKeys.rootKey,
                            path: 'chatParticipants/:groupId/:communityId',
                            builder:
                                (BuildContext context, GoRouterState state) {
                              final groupId = state.pathParameters['groupId'];
                              final communityId =
                                  state.pathParameters['communityId'];
                              return ChatParticipantsPage(
                                groupId: groupId.toString(),
                                communityId: communityId,
                              );
                            },
                            routes: [
                              GoRoute(
                                parentNavigatorKey: RouterKeys.rootKey,
                                path:
                                    'appointManagment/:userId/:groupId/:communityId',
                                builder: (
                                  BuildContext context,
                                  GoRouterState state,
                                ) {
                                  final userId = state.pathParameters['userId'];
                                  final communityId =
                                      state.pathParameters['communityId'];
                                  final groupId =
                                      state.pathParameters['groupId'];
                                  return ChatGroupAppointManagmentPage(
                                    userId: userId.toString(),
                                    groupId: groupId.toString(),
                                    communityId: communityId.toString(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: RouterKeys.advertKey,
            routes: [
              GoRoute(
                name: RouterContants.adverts,
                path: RouterContants.adverts,
                builder: (context, state) => const AdvertsPage(),
                routes: [
                  GoRoute(
                    name: RouterContants.advertDetailPage,
                    path: RouterContants.advertDetailPage,
                    builder: (context, state) {
                      return const AdverDetailPage();
                    },
                  ),
                  GoRoute(
                    name: RouterContants.advertMyAdvertsPage,
                    path: RouterContants.advertMyAdvertsPage,
                    builder: (context, state) {
                      return const AdvertMyAdvertsPage();
                    },
                  ),
                  GoRoute(
                    name: RouterContants.advertEditAdvertsPage,
                    path: RouterContants.advertEditAdvertsPage,
                    builder: (context, state) {
                      return const AdvertEditPage();
                    },
                  ),
                  GoRoute(
                    name: RouterContants.advertProductAndServicePage,
                    path: RouterContants.advertProductAndServicePage,
                    builder: (context, state) {
                      return const AdvertProductAndServicePage();
                    },
                  ),
                  GoRoute(
                    name: RouterContants.advertAddServicePage,
                    path: RouterContants.advertAddServicePage,
                    builder: (context, state) {
                      return const AdvertAddServicePage();
                    },
                  ),
                  GoRoute(
                    name: RouterContants.advertCreateAdvertPage,
                    path: RouterContants.advertCreateAdvertPage,
                    builder: (context, state) {
                      return const AdvertCreateAdvertPage();
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: RouterKeys.questionKey,
            routes: [
              GoRoute(
                name: RouterContants.question,
                path: RouterContants.question,
                builder: (context, state) => const QuestionPage(),
                routes: [
                  GoRoute(
                    path: 'question-datail/:questionId',
                    builder: (BuildContext context, GoRouterState state) {
                      final questionId = state.pathParameters['questionId'];
                      return QuestionDetailPage(
                        questionId: questionId.toString(),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: "${RouterContants.profilePersonPage}/:authorId",
                        builder: (BuildContext context, GoRouterState state) {
                          final authorId = state.pathParameters['authorId'];
                          return ProfilePersonPage(
                            authorId: authorId.toString(),
                          );
                        },
                        routes: [
                          GoRoute(
                            parentNavigatorKey: RouterKeys.rootKey,
                            path: '${RouterContants.post}/:postId',
                            builder: (
                              BuildContext context,
                              GoRouterState state,
                            ) {
                              final postId = state.pathParameters['postId'];
                              return HomePostPage(
                                postId: postId,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: RouterKeys.communities,
            routes: [
              GoRoute(
                name: RouterContants.communities,
                path: RouterContants.communities,
                builder: (context, state) => const CommunitiesPage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    name: RouterContants.communityCreate,
                    path: RouterContants.communityCreate,
                    builder: (context, state) => const CommunityCreatePage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    name: RouterContants.communityProfileSubscribe,
                    path:
                        "${RouterContants.communityProfileSubscribe}/:communityId",
                    builder: (BuildContext context, GoRouterState state) {
                      final communityId = state.pathParameters['communityId'];
                      return CommunityProfileSubscribePage(
                        communityId: communityId.toString(),
                      );
                    },
                    routes: [
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: 'community-detail/:communityId/:postId',
                        builder: (BuildContext context, GoRouterState state) {
                          final communityId =
                              state.pathParameters['communityId'];
                          final postId = state.pathParameters['postId'];
                          return CommunityPostDetailPage(
                            postId: postId,
                            communityId: communityId.toString(),
                          );
                        },
                        routes: [
                          GoRoute(
                            parentNavigatorKey: RouterKeys.rootKey,
                            path: "${RouterContants.profilePersonPage}/:userId",
                            builder:
                                (BuildContext context, GoRouterState state) {
                              final userId = state.pathParameters['userId'];
                              return ProfilePersonPage(
                                authorId: userId.toString(),
                              );
                            },
                            routes: [
                              GoRoute(
                                parentNavigatorKey: RouterKeys.rootKey,
                                path: '${RouterContants.post}/:postId',
                                builder: (
                                  BuildContext context,
                                  GoRouterState state,
                                ) {
                                  final postId = state.pathParameters['postId'];
                                  return HomePostPage(
                                    postId: postId,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path:
                            '${RouterContants.chatGroupMessages}/:groupId/:communityId',
                        builder: (BuildContext context, GoRouterState state) {
                          final groupId = state.pathParameters['groupId'];
                          final communityId =
                              state.pathParameters['communityId'];
                          return ChatGroupMessagesPage(
                            groupId: groupId.toString(),
                            communityId: communityId.toString(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: '${RouterContants.communityProfile}/:communityId',
                    builder: (BuildContext context, GoRouterState state) {
                      final communityId = state.pathParameters['communityId'];
                      return CommunityProfilePage(
                        communityId: communityId.toString(),
                      );
                    },
                    routes: [
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: 'community-detail/:communityId/:postId',
                        builder: (BuildContext context, GoRouterState state) {
                          final communityId =
                              state.pathParameters['communityId'];
                          final postId = state.pathParameters['postId'];
                          return CommunityPostDetailPage(
                            postId: postId,
                            communityId: communityId.toString(),
                          );
                        },
                        routes: [
                          GoRoute(
                            parentNavigatorKey: RouterKeys.rootKey,
                            path: "${RouterContants.profilePersonPage}/:userId",
                            builder:
                                (BuildContext context, GoRouterState state) {
                              final userId = state.pathParameters['userId'];
                              return ProfilePersonPage(
                                authorId: userId.toString(),
                              );
                            },
                            routes: [
                              GoRoute(
                                parentNavigatorKey: RouterKeys.rootKey,
                                path: '${RouterContants.post}/:postId',
                                builder: (
                                  BuildContext context,
                                  GoRouterState state,
                                ) {
                                  final postId = state.pathParameters['postId'];
                                  return HomePostPage(
                                    postId: postId,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path:
                            '${RouterContants.communityAddPublic}/:communityId',
                        builder: (BuildContext context, GoRouterState state) {
                          final communityId =
                              state.pathParameters['communityId'];
                          return CommunityAddPublicPage(
                            communityId: communityId.toString(),
                          );
                        },
                      ),
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: 'chatAdmins/:groupId/:communityId',
                        builder: (BuildContext context, GoRouterState state) {
                          final groupId = state.pathParameters['groupId'];
                          final communityId =
                              state.pathParameters['communityId'];

                          return ChatGroupAdminsPage(
                            communityId: communityId,
                            groupId: groupId.toString(),
                          );
                        },
                      ),
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path:
                            '${RouterContants.chatGroupMessages}/:groupId/:communityId',
                        builder: (BuildContext context, GoRouterState state) {
                          final groupId = state.pathParameters['groupId'];
                          final communityId =
                              state.pathParameters['communityId'];

                          return ChatGroupMessagesPage(
                            communityId: communityId.toString(),
                            groupId: groupId.toString(),
                          );
                        },
                      ),
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: "${RouterContants.communityEdit}/:communityId",
                        builder: (BuildContext context, GoRouterState state) {
                          final communityId =
                              state.pathParameters['communityId'];
                          return CommunityEditPage(
                            communityId: communityId.toString(),
                          );
                        },
                      ),
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: 'chatParticipants/:groupId/:communityId',
                        builder: (BuildContext context, GoRouterState state) {
                          final groupId = state.pathParameters['groupId'];
                          final communityId =
                              state.pathParameters['communityId'];
                          return ChatParticipantsPage(
                            communityId: communityId,
                            groupId: groupId.toString(),
                          );
                        },
                      ),
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        name: RouterContants.communityChat,
                        path: "${RouterContants.communityChat}/:communityId",
                        builder: (BuildContext context, GoRouterState state) {
                          final communityId =
                              state.pathParameters['communityId'];
                          return CommunityChatPage(
                            communityId: communityId.toString(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: "${RouterContants.communityMembers}/:communityId",
                    builder: (BuildContext context, GoRouterState state) {
                      final communityId = state.pathParameters['communityId'];
                      return CommunityMembersPage(
                        communityId: communityId.toString(),
                      );
                    },
                    routes: [
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: 'follower-subscribe-profile/:participantsUid',
                        builder: (BuildContext context, GoRouterState state) {
                          final uid = state.pathParameters['participantsUid'];
                          return FollowerSubscribeProfilePage(
                            userId: uid.toString(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    name: RouterContants.communitySubscribers,
                    path: RouterContants.communitySubscribers,
                    builder: (context, state) =>
                        const CommunitySubscribersPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    name: RouterContants.communityManagers,
                    path: RouterContants.communityManagers,
                    builder: (context, state) => const CommunityManagersPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    name: RouterContants.communityEditManagers,
                    path: RouterContants.communityEditManagers,
                    builder: (context, state) =>
                        const CommunityEditManagersPage(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: RouterKeys.profileKey,
            routes: [
              GoRoute(
                name: RouterContants.profile,
                path: RouterContants.profile,
                builder: (context, state) => const ProfilePage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: '${RouterContants.post}/:postId',
                    builder: (BuildContext context, GoRouterState state) {
                      final postId = state.pathParameters['postId'];
                      return HomePostPage(
                        postId: postId,
                      );
                    },
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: 'subscriptions/:userId',
                    builder: (BuildContext context, GoRouterState state) {
                      final userId = state.pathParameters['userId'];
                      return SubscriptionsUsersPage(
                        userId: userId.toString(),
                      );
                    },
                    routes: [
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: 'follower-subscribe-profile/:subscriptionUid',
                        builder: (BuildContext context, GoRouterState state) {
                          final uid = state.pathParameters['subscriptionUid'];
                          return FollowerSubscribeProfilePage(
                            userId: uid.toString(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: 'followers/:userId',
                    builder: (BuildContext context, GoRouterState state) {
                      final userId = state.pathParameters['userId'];
                      return FollowersUsersPage(userId: userId.toString());
                    },
                    routes: [
                      GoRoute(
                        parentNavigatorKey: RouterKeys.rootKey,
                        path: 'follower-subscribe-profile/:followerUid',
                        builder: (BuildContext context, GoRouterState state) {
                          final uid = state.pathParameters['followerUid'];
                          return FollowerSubscribeProfilePage(
                            userId: uid.toString(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: RouterContants.profileEdit,
                    builder: (context, state) => const ProfileEditPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: RouterContants.homeNotification,
                    builder: (context, state) => const HomeNotificationPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: RouterContants.profileSettings,
                    builder: (context, state) => const ProfileSettingsPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: 'profile-phone',
                    builder: (context, state) => const ProfilePhonePage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: 'profile-date',
                    builder: (context, state) => const ProfileDatePage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: RouterContants.createPost,
                    builder: (context, state) => const CreatePostPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: RouterContants.profileNewEmail,
                    builder: (context, state) => const ProfileNewEmailPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  GoRouter get routerConfig => _router;
}
