import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_app_bar.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/my_adverts/my_adverts_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_back_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_refresh_indicator.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_widget.dart';

class AdvertMyAdvertsPage extends StatefulWidget {
  const AdvertMyAdvertsPage({super.key});

  @override
  State<AdvertMyAdvertsPage> createState() => _AdvertMyAdvertsPageState();
}

class _AdvertMyAdvertsPageState extends State<AdvertMyAdvertsPage> {
  @override
  void initState() {
    super.initState();

    context.read<MyAdvertsCubit>().getAdverts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColors,
      appBar: GlAppBar(
        leading: AdvertBackButton(
          onTap: () {
            context.pop();
          },
        ),
        title: Text(
          "Мои объявления",
          style: AppStyles.w500f18,
        ),
      ),
      body: AdvertRefreshIndicator(
        onRefresh: () => context.read<MyAdvertsCubit>().getAdverts(),
        child: BlocBuilder<MyAdvertsCubit, MyAdvertsState>(
          builder: (context, state) {
            return state.maybeMap(
              loadSuccess: (state) {
                final adverts = state.adverts;

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  itemCount: adverts.length,
                  itemBuilder: (context, index) {
                    final advert = adverts[index];

                    return AdvertWidget(
                      images: advert.images,
                      name: advert.name,
                      description: advert.description,
                      rating: advert.rating,
                      address: advert.location.formattedAddress,
                      reviewsCount: advert.reviewsCount,
                      schedule: advert.schedule,
                      coordinates: advert.location.coordinates,
                      onEditTap: () {
                        context.push(
                          "/adverts/${RouterContants.advertEditAdvertsPage}",
                          extra: advert,
                        );
                      },
                    );
                  },
                );
              },
              orElse: () {
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}
