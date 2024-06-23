import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_app_bar.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/search_result/search_result_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_back_button.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AdvertAddressSelectPage extends StatelessWidget {
  const AdvertAddressSelectPage({
    super.key,
    required this.searchResult,
  });

  final SearchResult? searchResult;

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
          "Выберите адрес",
          style: AppStyles.w500f18,
        ),
      ),
      body: _AdvertAddressSelectBody(
        searchResult: searchResult,
      ),
    );
  }
}

class _AdvertAddressSelectBody extends StatefulWidget {
  const _AdvertAddressSelectBody({
    required this.searchResult,
  });

  final SearchResult? searchResult;

  @override
  State<_AdvertAddressSelectBody> createState() =>
      _AdvertAddressSelectBodyState();
}

class _AdvertAddressSelectBodyState extends State<_AdvertAddressSelectBody> {
  late final YandexMapController controller;

  final List<MapObject> mapObjects = [];

  SearchItem? searchItem;
  bool progress = false;

  Future<void> _search(Point point, double zoom) async {
    progress = true;
    setState(() {});

    final resultWithSession = await YandexSearch.searchByPoint(
      point: point,
      zoom: zoom.toInt(),
      searchOptions: const SearchOptions(
        searchType: SearchType.geo,
      ),
    );

    await _handleSearchResult(resultWithSession.$2, resultWithSession.$1);
  }

  Future<void> _handleSearchResult(
    Future<SearchSessionResult> futureResult,
    SearchSession session,
  ) async {
    final result = await futureResult;

    if (result.error != null) {
      progress = false;
      setState(() {});
      return;
    }

    progress = false;
    searchItem = result.items?.first;

    session.close();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        YandexMap(
          mapObjects: mapObjects,
          onMapCreated: (yandexMapController) async {
            controller = yandexMapController;

            final searchResult = widget.searchResult;
            if (searchResult != null) {
              final coordinates = searchResult.coordinates;

              final point = Point(
                latitude: coordinates.$1,
                longitude: coordinates.$2,
              );
              final placemark = getPlacemark(point);
              mapObjects.add(placemark);

              setState(() {});

              await controller.moveCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: point,
                    zoom: const CameraBounds().maxZoom,
                  ),
                ),
                animation: const MapAnimation(duration: 1),
              );
            }
          },
          onMapTap: (point) async {
            mapObjects.clear();

            final placemark = getPlacemark(point);
            mapObjects.add(placemark);

            setState(() {});

            final position = await controller.getCameraPosition();
            await _search(point, position.zoom);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: getBody(),
        ),
        if (searchItem != null &&
            searchItem!.toponymMetadata!.address.addressComponents
                .containsKey(SearchComponentKind.house))
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18)
                  .copyWith(bottom: 50),
              child: GlButton(
                text: "Готово",
                onPressed: () {
                  final name = searchItem!.name;
                  final formattedAddress =
                      searchItem!.toponymMetadata!.address.formattedAddress;
                  final balloonPoint =
                      searchItem!.toponymMetadata!.balloonPoint;

                  final searchResult = SearchResult(
                    name: name,
                    formattedAddress: formattedAddress,
                    coordinates: (
                      balloonPoint.latitude,
                      balloonPoint.longitude,
                    ),
                  );

                  context.pop(searchResult);
                },
              ),
            ),
          ),
      ],
    );
  }

  PlacemarkMapObject getPlacemark(Point point) {
    return PlacemarkMapObject(
      mapId: const MapObjectId("placemark"),
      point: point,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
            Assets.images.place.path,
          ),
          scale: 0.75,
        ),
      ),
    );
  }

  Widget getBody() {
    if (progress) {
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingWidget(),
        ],
      );
    }

    if (searchItem != null) {
      final name = searchItem!.name;
      final formattedAddress =
          searchItem!.toponymMetadata!.address.formattedAddress;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ResultWidget(
          name: name,
          formattedAddress: formattedAddress,
        ),
      );
    }

    final searchResult = widget.searchResult;
    if (searchResult != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ResultWidget(
          name: searchResult.name,
          formattedAddress: searchResult.formattedAddress,
        ),
      );
    }

    return const SizedBox.shrink();
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const CircularProgressIndicator(
        color: AppColors.purple,
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    super.key,
    required this.name,
    required this.formattedAddress,
  });

  final String name;
  final String formattedAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            name,
            style: AppStyles.w500f16,
          ),
          const Gap(6),
          Text(
            formattedAddress,
            style: AppStyles.w400f14.copyWith(
              color: AppColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
