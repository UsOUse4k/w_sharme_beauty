import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/adverts_page.dart';
import 'package:w_sharme_beauty/features/app/widgets/app.dart';
import 'package:w_sharme_beauty/features/auth/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/communities/presentation/pages/commutiies_page.dart';
import 'package:w_sharme_beauty/features/home/presentation/pages/home_page.dart';
import 'package:w_sharme_beauty/features/main/presentation/pages/main_page.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/question/presentation/pages/question_page.dart';

mixin AppRouter on State<App> {
  static final _rootKey = GlobalKey<NavigatorState>();
  static final _homeKey = GlobalKey<NavigatorState>();
  static final _communityKey = GlobalKey<NavigatorState>();
  static final _advertKey = GlobalKey<NavigatorState>();
  static final _questionKey = GlobalKey<NavigatorState>();
  static final _profileKey = GlobalKey<NavigatorState>();

  final GoRouter _router = GoRouter(
    navigatorKey: _rootKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: AuthorizationPage.route,
        path: AuthorizationPage.route,
        builder: (context, state) => const AuthorizationPage(),
      ),
      GoRoute(
        name: SignUpPage.route,
        path: SignUpPage.route,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        name: ConfirmationOfRegistrationPage.route,
        path: ConfirmationOfRegistrationPage.route,
        builder: (context, state) => const ConfirmationOfRegistrationPage(),
      ),
      GoRoute(
        name: ProfileDataAuthPage.route,
        path: ProfileDataAuthPage.route,
        builder: (context, state) => const ProfileDataAuthPage(),
      ),
      GoRoute(
        name: ConfirmPasswordReset.route,
        path: ConfirmPasswordReset.route,
        builder: (context, state) => const ConfirmPasswordReset(),
      ),
      GoRoute(
        name: NewPasswordPage.route,
        path: NewPasswordPage.route,
        builder: (context, state) => const NewPasswordPage(),
      ),
      GoRoute(
        name: PasswordResetPage.route,
        path: PasswordResetPage.route,
        builder: (context, state) => const PasswordResetPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainPage(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeKey,
            routes: [
              GoRoute(
                name: HomePage.route,
                path: HomePage.route,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _communityKey,
            routes: [
              GoRoute(
                name: CommutiesPage.route,
                path: CommutiesPage.route,
                builder: (context, state) => const CommutiesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _advertKey,
            routes: [
              GoRoute(
                name: AdvertsPage.route,
                path: AdvertsPage.route,
                builder: (context, state) => const AdvertsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _questionKey,
            routes: [
              GoRoute(
                name: QuestionPage.route,
                path: QuestionPage.route,
                builder: (context, state) => const QuestionPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _profileKey,
            routes: [
              GoRoute(
                name: ProfilePage.route,
                path: ProfilePage.route,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  GoRouter get routerConfig => _router;
}
