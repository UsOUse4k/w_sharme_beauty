import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/app/widgets/app.dart';
import 'package:w_sharme_beauty/features/auth/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/chat/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/communities/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/home/data/data/post_data.dart';
import 'package:w_sharme_beauty/features/home/data/model/post_card_model.dart';
import 'package:w_sharme_beauty/features/home/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/home/presentation/pages/sub_pages/sub_pages.dart';
import 'package:w_sharme_beauty/features/main/presentation/pages/main_page.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/sub_pages/sub_pages.dart';
import 'package:w_sharme_beauty/features/question/presentation/pages/pages.dart';

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
                    path: 'post/:postId',
                    builder: (BuildContext context, GoRouterState state) {
                      PostCardModel? fetchPostById(String? postId) {
                        return posts.firstWhere(
                          (post) => post.id == postId,
                        );
                      }

                      final postId = state.pathParameters['postId'];
                      final post = fetchPostById(postId);
                      return HomePostPage(
                        post: post!,
                      );
                    },
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: RouterContants.homeNotification,
                    builder: (context, state) => const HomeNotificationPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: RouterKeys.rootKey,
                    path: RouterContants.chat,
                    builder: (context, state) => const ChatPage(),
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
                    path: RouterContants.profileAddPublic,
                    builder: (context, state) => const ProfileAddPublicPage(),
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
