import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_map_controll_buttons.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AdvertRoutePage extends StatefulWidget {
  const AdvertRoutePage({super.key, required this.advert});

  final Advert advert;

  @override
  State<AdvertRoutePage> createState() => _AdvertRoutePageState();
}

class _AdvertRoutePageState extends State<AdvertRoutePage> {
  final GlobalKey key = GlobalKey();

  late final YandexMapController controller;

  late final PlacemarkMapObject startPlacemark;
  late final PlacemarkMapObject endPlacemark;

  final List<MapObject> mapObjects = [];

  final MapAnimation animation = const MapAnimation(duration: 0.25);

  Future<bool> get locationPermissionGranted async =>
      await Permission.location.request().isGranted;

  DrivingRoute? route;
  bool progress = true;

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

  Future<void> _init() async {
    final position = (await controller.getUserCameraPosition())!;

    startPlacemark = PlacemarkMapObject(
      mapId: const MapObjectId('start_placemark'),
      point: position.target,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(Assets.images.routeStart.path),
          anchor: const Offset(0.5, 1),
        ),
      ),
    );

    final advertCoordinates = widget.advert.location.coordinates;
    endPlacemark = PlacemarkMapObject(
      mapId: const MapObjectId('end_placemark'),
      point: Point(
        latitude: advertCoordinates.$1,
        longitude: advertCoordinates.$2,
      ),
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(Assets.images.routeEnd.path),
          anchor: const Offset(0.5, 1),
        ),
      ),
    );

    mapObjects.addAll([
      startPlacemark,
      endPlacemark,
    ]);

    setState(() {});

    await _requestRoutes();
  }

  Future<void> _requestRoutes() async {
    final resultWithSession = await YandexDriving.requestRoutes(
      points: [
        RequestPoint(
          point: startPlacemark.point,
          requestPointType: RequestPointType.wayPoint,
        ),
        RequestPoint(
          point: endPlacemark.point,
          requestPointType: RequestPointType.wayPoint,
        ),
      ],
      drivingOptions: const DrivingOptions(),
    );

    await _handleResult(
      resultWithSession.$2,
      resultWithSession.$1,
    );
  }

  Future<void> _handleResult(
    Future<DrivingSessionResult> futureResult,
    DrivingSession session,
  ) async {
    final result = await futureResult;

    setState(() {
      progress = false;
    });

    if (result.error != null) {
      return;
    }

    route = result.routes?.first;

    if (route != null) {
      mapObjects.add(
        PolylineMapObject(
          mapId: const MapObjectId('route'),
          polyline: route!.geometry,
          strokeColor: AppColors.purple,
          strokeWidth: 3,
        ),
      );
    }

    session.close();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.bgColors,
      body: Stack(
        children: [
          YandexMap(
            key: key,
            onMapCreated: (yandexMapController) async {
              controller = yandexMapController;

              if (!await locationPermissionGranted) {
                return;
              }

              final height = key.currentContext!.size!.height *
                  mediaQuery.devicePixelRatio;
              final width =
                  key.currentContext!.size!.width * mediaQuery.devicePixelRatio;

              await controller.toggleUserLayer(
                visible: true,
                anchor: UserLocationAnchor(
                  course: Offset(0.5 * width, 0.5 * height),
                  normal: Offset(0.5 * width, 0.5 * height),
                ),
              );
            },
            onUserLocationAdded: (view) async {
              final position = (await controller.getUserCameraPosition())!;

              await controller.moveCamera(
                CameraUpdate.newCameraPosition(
                  position.copyWith(zoom: const CameraBounds().maxZoom),
                ),
                animation: const MapAnimation(
                  type: MapAnimationType.linear,
                  duration: 0.3,
                ),
              );

              await _init();

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
          Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        const Spacer(),
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
                        const Gap(100),
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
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    const Gap(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ],
                    ),
                    const Gap(14),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.purple,
                                      width: 4,
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  "Мое местоположение",
                                  style: AppStyles.w400f18.copyWith(
                                    color: AppColors.darkGrey,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(4),
                            Container(
                              width: 2,
                              height: 12,
                              margin: const EdgeInsets.only(left: 9),
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            const Gap(4),
                            Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.red,
                                      width: 4,
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  widget.advert.location.address,
                                  style: AppStyles.w400f18,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Assets.svgs.close.svg(),
                        ),
                      ],
                    ),
                    const Gap(15),
                    getBody(),
                    const Gap(30),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    if (progress) {
      return const LoadingWidget();
    }

    if (route != null) {
      final distance = route!.metadata.weight.distance.text;
      final time = route!.metadata.weight.time.text;

      return ResultWidget(
        distance: distance,
        time: time,
      );
    }

    return Text(
      "Невозможно построить маршрут",
      style: AppStyles.w400f14,
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    super.key,
    required this.time,
    required this.distance,
  });

  final String time;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            time,
            style: AppStyles.w400f20,
          ),
          const Gap(6),
          Text(
            "$distance, Лучший маршрут",
            style: AppStyles.w400f20.copyWith(
              color: AppColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const CircularProgressIndicator(
        color: AppColors.purple,
      ),
    );
  }
}
