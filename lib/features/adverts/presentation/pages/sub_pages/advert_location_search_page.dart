import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/search_results/search_results_cubit.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AdvertLocationSearchPage extends StatelessWidget {
  const AdvertLocationSearchPage({super.key, required this.searchResultsCubit});

  final SearchResultsCubit searchResultsCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColors,
      body: BlocProvider.value(
        value: searchResultsCubit,
        child: const AdvertLocationSearchBody(),
      ),
    );
  }
}

class AdvertLocationSearchBody extends StatefulWidget {
  const AdvertLocationSearchBody({super.key});

  @override
  State<AdvertLocationSearchBody> createState() =>
      _AdvertLocationSearchBodyState();
}

class _AdvertLocationSearchBodyState extends State<AdvertLocationSearchBody> {
  late final TextEditingController queryController;
  late final FocusNode focusNode;

  final List<SuggestItem> suggestionResults = [];
  final List<SearchItem> searchResults = [];
  bool _progress = false;

  @override
  void initState() {
    super.initState();

    queryController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    queryController.dispose();
    focusNode.dispose();

    super.dispose();
  }

  Future<void> _suggest(String query) async {
    if (query.isEmpty) {
      suggestionResults.clear();
      setState(() {});
      return;
    }

    _progress = true;
    setState(() {});

    final resultWithSession = await YandexSuggest.getSuggestions(
      text: query,
      boundingBox: const BoundingBox(
        northEast: Point(latitude: 56.0421, longitude: 38.0284),
        southWest: Point(latitude: 55.5143, longitude: 37.24841),
      ),
      suggestOptions: const SuggestOptions(
        suggestType: SuggestType.geo,
        userPosition: Point(latitude: 56.0321, longitude: 38),
      ),
    );

    await _handleSuggestionResult(resultWithSession.$2, resultWithSession.$1);
  }

  Future<void> _handleSuggestionResult(
    Future<SuggestSessionResult> futureResult,
    SuggestSession session,
  ) async {
    final result = await futureResult;

    if (result.error != null) {
      _progress = false;
      setState(() {});
      return;
    }

    _progress = false;
    searchResults.clear();
    suggestionResults.clear();
    suggestionResults.addAll(result.items ?? []);
    setState(() {});

    session.close();
  }

  Future<void> _search(String query) async {
    _progress = true;
    setState(() {});

    final resultWithSession = await YandexSearch.searchByText(
      searchText: query,
      geometry: Geometry.fromBoundingBox(
        const BoundingBox(
          southWest: Point(
            latitude: 55.76996383933034,
            longitude: 37.57483142322235,
          ),
          northEast: Point(
            latitude: 55.785322774728414,
            longitude: 37.590924677311705,
          ),
        ),
      ),
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
      _progress = false;
      setState(() {});
      return;
    }

    _progress = false;
    suggestionResults.clear();
    searchResults.clear();
    searchResults.addAll(result.items ?? []);
    setState(() {});

    while (await session.hasNextPage()) {
      final nextResult = await session.fetchNextPage();
      if (nextResult.error != null) {
        break;
      }
      searchResults.addAll(nextResult.items ?? []);
      setState(() {});
    }

    session.close();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Gap(MediaQuery.of(context).padding.top + 25),
              Container(
                height: 47,
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(Assets.svgs.arrowBack.path),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                    const Gap(2),
                    Flexible(
                      child: TextField(
                        controller: queryController,
                        focusNode: focusNode,
                        textInputAction: TextInputAction.search,
                        onTap: () => _suggest(queryController.text),
                        onChanged: (value) => _suggest(value),
                        onSubmitted: (value) async {
                          context
                              .read<SearchResultsCubit>()
                              .addSearchResult(SearchResult(title: value));
                          await _search(value);
                        },
                        style: AppStyles.w400f16,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Введите адресс",
                          hintStyle: AppStyles.w400f16.copyWith(
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ),
                    ),
                    const Gap(14),
                    GestureDetector(
                      onTap: () {
                        queryController.clear();

                        suggestionResults.clear();
                        searchResults.clear();

                        setState(() {});
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.darkGrey,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(15),
            ],
          ),
        ),
        if (suggestionResults.isEmpty && searchResults.isEmpty)
          Expanded(
            child: BlocBuilder<SearchResultsCubit, SearchResultsState>(
              builder: (context, state) {
                final results = state.searchResults;

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final result = results[index];

                    return ResultWidget(
                      title: result.title,
                      subtitle: result.subtitle,
                      onTap: () async {
                        if (result.subtitle == null) {
                          queryController.text = result.title;
                          focusNode.requestFocus();

                          await _suggest(result.title);

                          return;
                        }

                        context.pop(result);
                      },
                    );
                  },
                );
              },
            ),
          ),
        if (suggestionResults.isNotEmpty)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 18),
              itemCount: suggestionResults.length,
              itemBuilder: (context, index) {
                final result = suggestionResults[index];

                final title = result.title;

                return ResultWidget(
                  title: title,
                  onTap: () async {
                    if (title == queryController.text) {
                      FocusScope.of(context).unfocus();

                      await _search(title);
                      return;
                    }

                    queryController.text = title;
                    await _suggest(title);
                  },
                );
              },
            ),
          ),
        if (searchResults.isNotEmpty)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 18),
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final result = searchResults[index];

                final title = result.name;
                final subtitle =
                    result.toponymMetadata!.address.formattedAddress;
                final coordinates = result.toponymMetadata!.balloonPoint;

                return ResultWidget(
                  title: title,
                  subtitle: subtitle,
                  onTap: () {
                    final searchResult = SearchResult(
                      title: title,
                      subtitle: subtitle,
                      coordinates: (
                        coordinates.latitude,
                        coordinates.longitude,
                      ),
                    );
                    context
                        .read<SearchResultsCubit>()
                        .addSearchResult(searchResult);
                    context.pop(searchResult);
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: AppColors.white,
      child: Material(
        child: InkWell(
          onTap: () {
            onTap?.call();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                if (subtitle != null)
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: AppColors.lightGrey,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.location_on,
                      size: 18,
                      color: AppColors.darkGrey,
                    ),
                  )
                else
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE77331).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.search,
                      size: 18,
                      color: Color(0xFFE77331),
                    ),
                  ),
                const Gap(11),
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
                        Flexible(
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.w500f16,
                          ),
                        ),
                        if (subtitle != null)
                          Flexible(
                            child: Text(
                              subtitle!,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.w400f12.copyWith(
                                color: AppColors.darkGrey,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
