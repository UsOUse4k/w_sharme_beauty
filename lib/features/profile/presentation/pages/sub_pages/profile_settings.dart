import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';

import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/profile_setting_card_item_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/profile_setting_item_widget.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController dateCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context);
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
        title: CenterTitleAppBar(
          title: 'Настройки',
          textStyle: AppStyles.w500f22,
        ),
      ),
      body: BlocBuilder<MyProfileInfoBloc, MyProfileInfoState>(
        builder: (context, state) {
          return state.maybeWhen(
            succes: (user) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "УЧЕТНЫЕ ДАННЫЕ",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        ProfileSettingItemWidget(
                          title: 'Телефон',
                          subtitle: user.phone != ''
                              ? user.phone.toString()
                              : 'Не указан',
                          onTap: () {
                            route.push(
                              '/profile/${RouterContants.profileNumber}',
                            );
                          },
                        ),
                        ProfileSettingItemWidget(
                          title: 'День рождения',
                          subtitle: user.date != ''
                              ? user.date.toString()
                              : 'Не указан',
                          onTap: () {
                            route.push(
                              '/profile/${RouterContants.profileBirthDate}',
                            );
                          },
                        ),
                        BlocListener<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state is ChangePasswordSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'мы отправили вам ссылку для сброса пароля.',
                                  ),
                                ),
                              );
                            }
                            if (state is AuthError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    state.message,
                                  ),
                                ),
                              );
                            }
                          },
                          child: ProfileSettingItemWidget(
                            onTap: () {
                              route.push(
                                '/profile/${RouterContants.profileNewEmail}',
                              );
                            },
                            title: 'Email',
                            subtitle: user.email != null
                                ? user.email.toString()
                                : 'Не указан',
                            isVisible: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ProfileSettingCardItemWidget(
                    text: 'ПАРОЛЬ',
                    title: 'Сменить пароль',
                    onPresed: () {
                      context
                          .read<AuthBloc>()
                          .add(ChangePasswordEmailEvent(user.email.toString()));
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ProfileSettingCardItemWidget(
                    text: 'УВЕДОМЛЕНИЯ',
                    title: 'Настройки уведомления',
                    onPresed: () {
                      route.push(
                        '/profile/${RouterContants.profileNoticfactionSettings}',
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is LogoutSuccess) {
                        context.go(RouterContants.login);
                      }
                      if (state is AuthError) {}
                    },
                    child: ProfileSettingCardItemWidget(
                      text: 'АККАУНТ',
                      title: 'Выйти из аккаунта',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.red,
                            fontWeight: FontWeight.w700,
                          ),
                      onPresed: () {
                        context.read<AuthBloc>().add(LogoutEvent());
                      },
                    ),
                  ),
                ],
              );
            },
            orElse: () => Container(),
          );
        },
      ),
    );
  }
}
