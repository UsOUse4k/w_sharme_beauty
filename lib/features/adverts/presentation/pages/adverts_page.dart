import 'package:flutter/material.dart' hide Animation;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/core/widgets/gl_scaffold.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts/adverts_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts_filter/adverts_filter_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/current_location/current_location_bloc.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/search_adverts/search_adverts_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/advert_modal_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_map_controll_buttons.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_search_field.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/adverts_panel.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/adverts_search_modal_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/adverts_search_panel.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/all_adverts_panel.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AdvertsPage extends StatefulWidget {
  const AdvertsPage({super.key});

  @override
  State<AdvertsPage> createState() => _AdvertsPageState();
}

class _AdvertsPageState extends State<AdvertsPage> {
  final GlobalKey key = GlobalKey();

  late final YandexMapController controller;

  List<MapObject> mapObjects = [];

  final MapAnimation animation = const MapAnimation(duration: 0.25);

  Future<bool> get locationPermissionGranted async =>
      await Permission.location.request().isGranted;

  int content = 0;
  String queryText = "";

  @override
  void initState() {
    super.initState();

    context.read<AdvertsCubit>().getAdverts(useFiltering: false);
  }

  void showContent(int index) {
    content = index;

    setState(() {});
  }

  Future<void> zoomIn() async {
    await controller.moveCamera(
      CameraUpdate.zoomIn(),
      animation: animation,
    );
  }

  Future<void> zoomOut() async {
    await controller.moveCamera(
      CameraUpdate.zoomOut(),
      animation: animation,
    );
  }

  Future<void> navigateToUser() async {
    final position = (await controller.getUserCameraPosition())!;

    await controller.moveCamera(
      CameraUpdate.newCameraPosition(
        position.copyWith(
          zoom: const CameraBounds().maxZoom,
        ),
      ),
      animation: const MapAnimation(duration: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return GlScaffold(
      body: Stack(
        children: [
          MultiBlocListener(
            listeners: [
              BlocListener<CurrentLocationBloc, CurrentLocationState>(
                listener: (context, state) {
                  state.maybeMap(
                    loadFailure: (state) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                    },
                    orElse: () {},
                  );
                },
              ),
              BlocListener<AdvertsCubit, AdvertsState>(
                listener: (context, state) {
                  state.maybeMap(
                    loadSuccess: (state) {
                      final adverts = state.adverts;
                      mapObjects = adverts.map(
                        (advert) {
                          final coordinates = advert.location.coordinates;
                          final point = Point(
                            latitude: coordinates.$1,
                            longitude: coordinates.$2,
                          );
                          return PlacemarkMapObject(
                            mapId: MapObjectId(advert.id),
                            point: point,
                            opacity: 0.6,
                            text: PlacemarkText(
                              text: advert.name,
                              style: const PlacemarkTextStyle(
                                placement: TextStylePlacement.bottom,
                                color: AppColors.purple,
                                outlineColor: Colors.transparent,
                              ),
                            ),
                            icon: PlacemarkIcon.single(
                              PlacemarkIconStyle(
                                image: BitmapDescriptor.fromAssetImage(
                                  Assets.images.place.path,
                                ),
                              ),
                            ),
                            onTap: (_, __) {
                              controller
                                  .moveCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: point,
                                    zoom: const CameraBounds().maxZoom,
                                  ),
                                ),
                                animation: const MapAnimation(duration: 1),
                              )
                                  .then(
                                (_) {
                                  showAdvertModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return AdvertModalBottomSheet(
                                        title: "Информация об объявлении",
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Gap(10),
                                            Text(
                                              advert.name,
                                              style: AppStyles.w500f18,
                                            ),
                                            const Gap(6),
                                            Text(
                                              advert.description,
                                              style: AppStyles.w400f16.copyWith(
                                                color: AppColors.darkGrey,
                                              ),
                                            ),
                                            const Gap(6),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: AppColors.yellow,
                                                ),
                                                const Gap(6),
                                                Text(
                                                  advert.rating.toString(),
                                                  style: AppStyles.w500f16,
                                                ),
                                                const Gap(2),
                                                Text(
                                                  ' /5 ',
                                                  style: AppStyles.w400f12
                                                      .copyWith(
                                                    color: AppColors.darkGrey,
                                                  ),
                                                ),
                                                const Gap(2),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    bottom: 3,
                                                  ),
                                                  child: Text(
                                                    '(${advert.reviewsCount})',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: AppColors.darkGrey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Gap(10),
                                            GlButton(
                                              text: "Посмотреть",
                                              onPressed: () {
                                                Navigator.pop(context);

                                                context.push(
                                                  "/adverts/${RouterContants.advertDetailPage}",
                                                  extra: advert,
                                                );
                                              },
                                            ),
                                            const Gap(20),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                      ).toList();

                      setState(() {});
                    },
                    orElse: () {},
                  );
                },
              ),
            ],
            child: YandexMap(
              key: key,
              onMapCreated: (yandexMapController) async {
                controller = yandexMapController;

                if (!await locationPermissionGranted) {
                  return;
                }

                final height = key.currentContext!.size!.height *
                    mediaQuery.devicePixelRatio;
                final width = key.currentContext!.size!.width *
                    mediaQuery.devicePixelRatio;

                await controller.toggleUserLayer(
                  visible: true,
                  anchor: UserLocationAnchor(
                    course: Offset(0.5 * width, 0.5 * height),
                    normal: Offset(0.5 * width, 0.5 * height),
                  ),
                );
              },
              onUserLocationAdded: (view) async {
                final userLocation = await controller.getUserCameraPosition();

                if (userLocation != null) {
                  await controller.moveCamera(
                    CameraUpdate.newCameraPosition(
                      userLocation.copyWith(zoom: const CameraBounds().maxZoom),
                    ),
                    animation: const MapAnimation(
                      type: MapAnimationType.linear,
                      duration: 0.3,
                    ),
                  );
                }

                return view.copyWith(
                  pin: view.pin.copyWith(
                    opacity: 0.6,
                    icon: PlacemarkIcon.single(
                      PlacemarkIconStyle(
                        anchor: const Offset(0.5, 1),
                        scale: 1.5,
                        image: BitmapDescriptor.fromAssetImage(
                          Assets.images.user.path,
                        ),
                      ),
                    ),
                  ),
                  arrow: view.arrow.copyWith(
                    icon: PlacemarkIcon.single(
                      PlacemarkIconStyle(
                        image: BitmapDescriptor.fromAssetImage(
                          Assets.images.arrow.path,
                        ),
                      ),
                    ),
                  ),
                  accuracyCircle: view.accuracyCircle.copyWith(
                    fillColor: AppColors.purple.withOpacity(0.3),
                    strokeColor: AppColors.purple,
                  ),
                );
              },
              mapObjects: mapObjects,
            ),
          ),
          SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    const Gap(25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: AdvertSearchField(
                        queryText: queryText,
                        onTap: () {
                          showAdvertModalBottomSheet<String>(
                            context: context,
                            useRootNavigator: false,
                            enableDrag: true,
                            builder: (context) {
                              return BlocProvider(
                                create: (context) =>
                                    getIt<SearchAdvertsCubit>(),
                                child: const AdvertsSearchModalBottomSheet(),
                              );
                            },
                          ).then(
                            (value) {
                              if (value != null) {
                                queryText = value;

                                showContent(2);
                              }
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              const Gap(20),
                              ZoomInButton(
                                onTap: () async {
                                  await zoomIn();
                                },
                              ),
                              const Gap(12),
                              ZoomOutButton(
                                onTap: () async {
                                  await zoomOut();
                                },
                              ),
                              const Spacer(),
                              NavigateToUserButton(
                                onTap: () async {
                                  await navigateToUser();
                                },
                              ),
                              const Gap(20),
                            ],
                          ),
                          const Gap(20),
                        ],
                      ),
                    ),
                    if (content == 0)
                      AdvertsPanel(
                        onSearchTap: () {
                          showContent(1);
                        },
                      )
                    else
                      Gap(mediaQuery.size.height * 0.5 - 80),
                  ],
                ),
                if (content == 1)
                  MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => getIt<AdvertsCubit>(),
                      ),
                      BlocProvider(
                        create: (context) => getIt<AdvertsFilterCubit>(),
                      ),
                    ],
                    child: AllAdvertsPanel(
                      onCloseTap: () {
                        showContent(0);
                      },
                    ),
                  ),
                if (content == 2)
                  MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => getIt<AdvertsCubit>(),
                      ),
                      BlocProvider(
                        create: (context) => getIt<AdvertsFilterCubit>(),
                      ),
                    ],
                    child: AdvertsSearchPanel(
                      queryText: queryText,
                      onCloseTap: () {
                        queryText = "";

                        showContent(0);
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
