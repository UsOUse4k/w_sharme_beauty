import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/post.dart';

part 'like_community_post_event.dart';
part 'like_community_post_state.dart';
part 'like_community_post_bloc.freezed.dart';

@injectable
class LikeCommunityPostBloc
    extends Bloc<LikeCommunityPostEvent, LikeCommunityPostState> {
  LikeCommunityPostBloc() : super(const _SelectedPosts()) {
    on<LikeCommunityPostEvent>((event, emit) {
      //final List<Post> updatedPosts = List<Post>.from(state.selectedPosts);
      // final int count = 0;
      //if(updatedPosts.contains(event.post)) {
      //  count = count - 1;
      //}
    });
  }
}
