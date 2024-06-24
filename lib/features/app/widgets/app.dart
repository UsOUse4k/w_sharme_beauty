import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/core/provider/bloc_provider.dart';
import 'package:w_sharme_beauty/core/router/app_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/features/monitoring/dynamic_links_service.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with AppRouter {
  late StreamSubscription _incomingDynamicLinksSubscription;

  @override
  void initState() {
    super.initState();

    _openInitialDynamicLinkIfAny();

    _incomingDynamicLinksSubscription =
        getIt<DynamicLinkService>().onNewDynamicLinkPath().listen(
      (data) {
        routerConfig.push(data);
      },
    );
  }

  @override
  void dispose() {
    _incomingDynamicLinksSubscription.cancel();
    super.dispose();
  }

  Future<void> _openInitialDynamicLinkIfAny() async {
    final path = await getIt<DynamicLinkService>().getInitialDynamicLinkPath();
    if (path != null) {
      routerConfig.push(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 923),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProviders(
        child: MaterialApp.router(
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.bgColors,
          ),
          routerConfig: routerConfig,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
