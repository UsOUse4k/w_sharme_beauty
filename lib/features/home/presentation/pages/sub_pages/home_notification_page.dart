import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_date_ago.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_notification_bloc/get_all_notification_bloc.dart';
import 'package:w_sharme_beauty/features/home/presentation/widgets/notification_item_card.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';

class HomeNotificationPage extends StatefulWidget {
  const HomeNotificationPage({super.key});

  @override
  State<HomeNotificationPage> createState() => _HomeNotificationPageState();
}

class _HomeNotificationPageState extends State<HomeNotificationPage> {
  @override
  void initState() {
    context
        .read<GetAllNotificationBloc>()
        .add(const GetAllNotificationEvent.loaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: CenterTitleAppBar(
          title: 'Уведомления',
          textStyle: AppStyles.w500f22,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<GetAllNotificationBloc, GetAllNotificationState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (notification) {
                return BlocBuilder<MyProfileInfoBloc, MyProfileInfoState>(
                  builder: (context, state) {
                    return notification.isNotEmpty ? CustomContainer(
                      marginTop: 15,
                      marginBottom: 15,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = notification[index];
                          String? typeText;
                          if (item.type == 'comment') {
                            typeText =
                                'Оставил(а) комментарии под вашим постом';
                          } else if (item.type == 'like') {
                            typeText = 'Лайкнул(а) ваш пост';
                          } else {
                            typeText = 'Подписался(ась) на ваши обновления';
                          }
                          final dateFormat = formatDateTime(item.createAt!);
                          return NotificationItemCard(
                            item: item,
                            date: dateFormat,
                            typeText: typeText,
                            subscriptions: state.maybeWhen(orElse: () => [], succes:(user) => user.subscriptions!,),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15.h),
                        itemCount: notification.length,
                      ),
                    ) : const SizedBox.shrink();
                  },
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
