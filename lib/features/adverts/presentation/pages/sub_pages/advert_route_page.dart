import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_app_bar.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/current_location.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_back_button.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AdvertRoutePage extends StatefulWidget {
  const AdvertRoutePage({super.key, required this.advert});

  final Advert advert;

  @override
  State<AdvertRoutePage> createState() => _AdvertRoutePageState();
}

class _AdvertRoutePageState extends State<AdvertRoutePage> {
  late final YandexMapController controller;

  late final PlacemarkMapObject startPlacemark;
  late final PlacemarkMapObject endPlacemark;

  final List<MapObject> mapObjects = [];

  final List<DrivingRoute> routes = [];
  bool _progress = true;

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    final userPosition = await getCurrentLocation();

    startPlacemark = PlacemarkMapObject(
      mapId: const MapObjectId('start_placemark'),
      point: Point(
        latitude: userPosition.latitude,
        longitude: userPosition.longitude,
      ),
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(Assets.images.routeStart.path),
          scale: 0.6,
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
          scale: 0.6,
        ),
      ),
    );

    mapObjects.addAll([
      startPlacemark,
      endPlacemark,
    ]);

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
      _progress = false;
    });

    if (result.error != null) {
      return;
    }

    routes.addAll(result.routes ?? []);

    result.routes!.asMap().forEach(
      (i, route) {
        mapObjects.add(
          PolylineMapObject(
            mapId: MapObjectId('route_${i}_polyline'),
            polyline: route.geometry,
            strokeColor:
                Colors.primaries[Random().nextInt(Colors.primaries.length)],
            strokeWidth: 3,
          ),
        );
      },
    );

    setState(() {});

    if (routes.isNotEmpty) {
      await controller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: startPlacemark.point,
            zoom: const CameraBounds().maxZoom,
          ),
        ),
        animation: const MapAnimation(duration: 0.25),
      );
    }

    session.close();
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
          "Маршрут",
          style: AppStyles.w500f18,
        ),
      ),
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: (yandexMapController) {
              controller = yandexMapController;
            },
            mapObjects: mapObjects,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
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
                  ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          Text(
                            "Маршруты",
                            style: AppStyles.w700f18,
                          ),
                        ],
                      ),
                    ),
                    const Gap(15),
                    const Divider(
                      height: 0,
                      color: AppColors.lightGrey,
                    ),
                    if (!_progress && routes.isEmpty) ...[
                      const Gap(15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: [
                            Text(
                              "Невозможно построить маршрут",
                              style: AppStyles.w500f14,
                            ),
                          ],
                        ),
                      ),
                    ] else
                      Expanded(
                        child: ListView.builder(
                          itemCount: routes.length,
                          itemBuilder: (context, index) {
                            final route = routes[index];

                            final time = route.metadata.weight.time.text;
                            final distance =
                                route.metadata.weight.distance.text;

                            return ResultWidget(
                              title: "Дорога ${index + 1}",
                              time: time,
                              distance: distance,
                            );
                          },
                        ),
                      ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    super.key,
    required this.title,
    required this.time,
    required this.distance,
  });

  final String title;
  final String time;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          const Gap(18),
          Expanded(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.lightGrey,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyles.w500f16,
                  ),
                  Text(
                    time,
                    style: AppStyles.w400f14.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  Text(
                    distance,
                    style: AppStyles.w400f14.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
