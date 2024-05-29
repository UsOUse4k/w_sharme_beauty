import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/widgets/gl_cached_networ_image.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community/community.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

class MyBeutyList extends StatelessWidget {
  const MyBeutyList.beautyList({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUid = firebaseAuth.currentUser!.uid;
    return BlocBuilder<CommunityListBloc, CommunityListState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(
            child: Text('not data found'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: AppColors.purple,
            ),
          ),
          error: (error) => Center(
            child: Text(error),
          ),
          success: (data) {
            final filteredtEditors = data.where((element) => element.editors!.contains(currentUid)).toList();
            final filteredAdministrator = data.where((element) => element.administrator!.contains(currentUid)).toList();
            final filteredOwner = data.where((element) => element.uid == currentUid).toList();
            final List<Community> updatesData = [...filteredtEditors, ...filteredAdministrator, ...filteredOwner];
            return ListView.builder(
              itemCount: updatesData.length,
              itemExtent: 55,
              itemBuilder: (BuildContext context, int index) {
                final item = updatesData[index];
                return GestureDetector(
                  onTap: () {
                    context.push(
                      '/communities/${RouterContants.communityProfile}/${item.communityId}',
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(23),
                      ),
                      child: GlCachedNetworImage(
                        height: 46,
                        width: 46,
                        urlImage: item.avatarUrls,
                      ),
                    ),
                    title: Text(
                      item.communityName.toString(),
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "${item.category !=null && item.category!.isNotEmpty ? item.category!.join(', ') : ''}, ${item.participants!.length} участников",
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
