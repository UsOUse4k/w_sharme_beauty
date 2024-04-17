import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/app/widgets/app.dart';
import 'package:w_sharme_beauty/features/auth/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/chat/presentation/pages/pages.dart';
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
    routes: [
      GoRoute(
        name: RouterContants.main,
        path: RouterContants.main,
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
                    path: RouterContants.homeNotification,
                    builder: (context, state) => const HomeNotificationPage(),
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
            navigatorKey: RouterKeys.chat,
            routes: [
              GoRoute(
                name: RouterContants.chat,
                path: RouterContants.chat,
                builder: (context, state) => const ChatPage(),
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
                    path: RouterContants.profileEdit,
                    builder: (context, state) => const ProfileEditPage(),
                  ),
                  GoRoute(
                    name: RouterContants.homeNotification,
                    path: RouterContants.homeNotification,
                    builder: (context, state) => const HomeNotificationPage(),
                  ),
                  GoRoute(
                    name: RouterContants.profileSettings,
                    path: RouterContants.profileSettings,
                    builder: (context, state) => const ProfileSettingsPage(),
                  ),
                  GoRoute(
                    path: ProfileAddPublicPage.route,
                    builder: (context, state) => const ProfileAddPublicPage(),
                  ),
                  GoRoute(
                    path: ProfileNewEmailPage.route,
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
