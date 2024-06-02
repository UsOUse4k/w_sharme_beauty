import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/update_new_email_bloc/update_new_email_bloc.dart';

class ProfileDatePage extends StatefulWidget {
  const ProfileDatePage({super.key});

  @override
  State<ProfileDatePage> createState() => _ProfileDatePageState();
}

class _ProfileDatePageState extends State<ProfileDatePage> {
  final TextEditingController dateCtrl = TextEditingController();

  @override
  void dispose() {
    dateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
        title: CenterTitleAppBar(
          title: 'Редактировать профиль',
          textStyle: AppStyles.w500f18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: BlocConsumer<MyProfileInfoBloc, MyProfileInfoState>(
          listener: (context, state) {
            state.maybeWhen(
              succes: (user) {
                dateCtrl.text = user.dateUser.toString();
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              succes: (user) {
                return BlocListener<UpdateNewEmailBloc, UpdateNewEmailState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      error: (message) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(message)));
                      },
                      orElse: () {},
                    );
                  },
                  child: BlocListener<ProfileInfoUpdateBloc,
                      ProfileInfoUpdateState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        success: () {
                          context
                              .read<MyProfileInfoBloc>()
                              .add(const MyProfileInfoEvent.getMe());
                          context.go('/profile');
                        },
                        orElse: () {},
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.lightGrey,
                          ),
                          child: TextField(
                            controller: dateCtrl,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              labelText: 'День рождения',
                              isDense: true,
                              filled: true,
                              fillColor: AppColors.lightGrey,
                              labelStyle: AppStyles.w500f18
                                  .copyWith(color: AppColors.darkGrey),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        GlButton(
                          text: 'Отправить',
                          onPressed: () {
                            if (dateCtrl.text.isNotEmpty) {
                              context.read<ProfileInfoUpdateBloc>().add(
                                    ProfileInfoUpdateEvent.update(
                                      user.copyWith(
                                        dateUser: dateCtrl.text,
                                      ),
                                    ),
                                  );
                            }
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                );
              },
              orElse: () => Container(),
            );
          },
        ),
      ),
    );
  }
}
