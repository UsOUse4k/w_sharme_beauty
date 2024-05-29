// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:w_sharme_beauty/features/adverts/data/data/firebase_create_advert_facade.dart'
    as _i21;
import 'package:w_sharme_beauty/features/adverts/domain/repositories/i_create_advert_repository.dart'
    as _i20;
import 'package:w_sharme_beauty/features/adverts/presentation/create_advert_bloc/create_advert_bloc.dart'
    as _i22;
import 'package:w_sharme_beauty/features/auth/data/firebase_auth_facade.dart'
    as _i17;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart'
    as _i19;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i16;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i65;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i18;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i64;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart'
    as _i42;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart'
    as _i26;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/subscribe_bloc/subscribe_bloc.dart'
    as _i30;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart'
    as _i27;
import 'package:w_sharme_beauty/features/category/data/firebase_category_facade.dart'
    as _i24;
import 'package:w_sharme_beauty/features/category/domain/repositories/i_category_repository.dart'
    as _i23;
import 'package:w_sharme_beauty/features/category/presentation/bloc/category_bloc/category_bloc.dart'
    as _i25;
import 'package:w_sharme_beauty/features/chat/data/firebase_chat_facade.dart'
    as _i34;
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart'
    as _i33;
import 'package:w_sharme_beauty/features/chat/domain/use_cases/get_all_chats_use_cases.dart'
    as _i74;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart'
    as _i100;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart'
    as _i76;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart'
    as _i75;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart'
    as _i77;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart'
    as _i99;
import 'package:w_sharme_beauty/features/chat_group/data/firebase_chat_group_facade.dart'
    as _i32;
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart'
    as _i31;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/added_chat_users_group_bloc/added_chat_users_group_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart'
    as _i9;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/create_chat_group_bloc/create_chat_group_bloc.dart'
    as _i46;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/filter_users_invite/filter_users_invite_bloc.dart'
    as _i13;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_admins_sorted_bloc/get_admins_sorted_bloc.dart'
    as _i12;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_admins_chat_group_bloc/get_all_admins_chat_group_bloc.dart'
    as _i37;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart'
    as _i43;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart'
    as _i49;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart'
    as _i36;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_people_chat_bloc/invite_people_chat_bloc.dart'
    as _i10;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_users_chat_group_bloc/invite_users_chat_group_bloc.dart'
    as _i47;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart'
    as _i44;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart'
    as _i35;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_chat_group_bloc/update_chat_group_bloc.dart'
    as _i45;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_manager_chat_group_bloc/update_manager_chat_group_bloc.dart'
    as _i48;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i53;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i52;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart'
    as _i92;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i61;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart'
    as _i94;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart'
    as _i95;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart'
    as _i93;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_comment_facade.dart'
    as _i60;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_post_repository.dart'
    as _i41;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_repository.dart'
    as _i63;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart'
    as _i59;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart'
    as _i40;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i62;
import 'package:w_sharme_beauty/features/communities/domain/repositories/repositories.dart'
    as _i81;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i54;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_add_reply_comment_bloc/community_add_reply_comment_bloc.dart'
    as _i96;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_category_bloc/community_category_bloc.dart'
    as _i15;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_create_bloc/community_comment_create_bloc.dart'
    as _i101;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_likes_bloc/community_comment_likes_bloc.dart'
    as _i91;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_list_bloc/community_comment_list_bloc.dart'
    as _i90;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i84;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart'
    as _i58;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart'
    as _i68;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i97;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_parent_comment_id_bloc/community_parent_commet_id_bloc.dart'
    as _i11;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_detail_bloc/community_post_detail_bloc.dart'
    as _i80;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart'
    as _i71;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart'
    as _i78;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_reply_comment_lidt_bloc/community_reply_comment_list_bloc.dart'
    as _i89;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/like_community_post_bloc/like_community_post_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart'
    as _i82;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/subscribe_community_bloc/subscribe_community_bloc.dart'
    as _i70;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/update_community_bloc/update_community_bloc.dart'
    as _i69;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i39;
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart'
    as _i38;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i51;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i86;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i57;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i85;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i79;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i98;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart'
    as _i83;
import 'package:w_sharme_beauty/features/post/presentation/bloc/subscribe_post/subscibe_post_bloc.dart'
    as _i50;
import 'package:w_sharme_beauty/features/profile/data/firebase_profile_facade.dart'
    as _i67;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i66;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/category_list_bloc/category_list_bloc.dart'
    as _i14;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i28;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i72;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/update_new_email_bloc/update_new_email_bloc.dart'
    as _i87;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart'
    as _i29;
import 'package:w_sharme_beauty/features/question/data/data/firebase_question_facade.dart'
    as _i56;
import 'package:w_sharme_beauty/features/question/domain/repositories/i_question_repository.dart'
    as _i55;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/add_question_bloc.dart'
    as _i73;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_bloc/get_all_question_bloc.dart'
    as _i88;
import 'package:w_sharme_beauty/firebase_module.dart' as _i102;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.factory<_i3.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.factory<_i4.FirebaseFirestore>(() => firebaseModule.firebaseFirestore);
    gh.factory<_i5.FirebaseStorage>(() => firebaseModule.firebaseStorage);
    gh.factory<_i6.LikeCommunityPostBloc>(() => _i6.LikeCommunityPostBloc());
    gh.factory<_i7.ParentCommentIdBloc>(() => _i7.ParentCommentIdBloc());
    gh.factory<_i8.AddedChatUsersGroupBloc>(
        () => _i8.AddedChatUsersGroupBloc());
    gh.factory<_i9.ChatGroupCheckManagerBloc>(
        () => _i9.ChatGroupCheckManagerBloc());
    gh.factory<_i10.InvitePeopleChatBloc>(() => _i10.InvitePeopleChatBloc());
    gh.factory<_i11.CommunityParentCommetIdBloc>(
        () => _i11.CommunityParentCommetIdBloc());
    gh.factory<_i12.GetAdminsSortedBloc>(() => _i12.GetAdminsSortedBloc());
    gh.factory<_i13.FilterUsersInviteBloc>(() => _i13.FilterUsersInviteBloc());
    gh.factory<_i14.CategoryListBloc>(() => _i14.CategoryListBloc());
    gh.factory<_i15.CommunityCategoryBloc>(() => _i15.CommunityCategoryBloc());
    gh.lazySingleton<_i16.IAuthFacade>(() => _i17.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i18.LogoutUC>(
        () => _i18.LogoutUC(repository: gh<_i19.IAuthFacade>()));
    gh.lazySingleton<_i20.ICreateAdvartRepository>(
        () => _i21.FirebaseCreateAdvartRepository(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i22.CreateAdvertBloc>(() => _i22.CreateAdvertBloc(
          gh<_i20.ICreateAdvartRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.lazySingleton<_i23.ICategoryRepository>(
        () => _i24.FirebaseCategoryFacade(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i25.CategoryBloc>(
        () => _i25.CategoryBloc(gh<_i23.ICategoryRepository>()));
    gh.factory<_i26.GetAllUsersBloc>(
        () => _i26.GetAllUsersBloc(gh<_i19.IAuthFacade>()));
    gh.factory<_i27.UpdateStatusUserBloc>(
        () => _i27.UpdateStatusUserBloc(gh<_i19.IAuthFacade>()));
    gh.factory<_i28.MyProfileInfoBloc>(
        () => _i28.MyProfileInfoBloc(gh<_i19.IAuthFacade>()));
    gh.factory<_i29.UserDetailBloc>(
        () => _i29.UserDetailBloc(gh<_i19.IAuthFacade>()));
    gh.factory<_i30.SubscribeBloc>(
        () => _i30.SubscribeBloc(gh<_i19.IAuthFacade>()));
    gh.lazySingleton<_i31.IChatGroupRepository>(
        () => _i32.FirebaseChatGroupFacade(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i33.IChatRepository>(() => _i34.FirebaseChatFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i35.SendMessageGroupBloc>(() => _i35.SendMessageGroupBloc(
          gh<_i31.IChatGroupRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i36.GetGroupBloc>(() => _i36.GetGroupBloc(
          gh<_i31.IChatGroupRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i37.GetAllAdminsChatGroupBloc>(
        () => _i37.GetAllAdminsChatGroupBloc(
              gh<_i31.IChatGroupRepository>(),
              gh<_i19.IAuthFacade>(),
            ));
    gh.lazySingleton<_i38.IPostRepository>(() => _i39.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i40.ICommunityPostRepository>(
        () => _i41.FirestorePostRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i42.AuthBloc>(() => _i42.AuthBloc(gh<_i19.IAuthFacade>()));
    gh.factory<_i43.GetAllChatGroupBloc>(
        () => _i43.GetAllChatGroupBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i44.RemoveAdminChatGroupBloc>(
        () => _i44.RemoveAdminChatGroupBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i45.UpdateChatGroupBloc>(
        () => _i45.UpdateChatGroupBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i46.CreateChatGroupBloc>(
        () => _i46.CreateChatGroupBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i47.InviteUsersChatGroupBloc>(
        () => _i47.InviteUsersChatGroupBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i48.UpdateManagerChatGroupBloc>(
        () => _i48.UpdateManagerChatGroupBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i49.GetAllGroupMessagesBloc>(
        () => _i49.GetAllGroupMessagesBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i50.SubscibePostBloc>(() => _i50.SubscibePostBloc(
          gh<_i51.IPostRepository>(),
          gh<_i30.SubscribeBloc>(),
        ));
    gh.lazySingleton<_i52.ICommentRepository>(() => _i53.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i54.CommunityLikeBloc>(
        () => _i54.CommunityLikeBloc(gh<_i40.ICommunityPostRepository>()));
    gh.lazySingleton<_i55.IQuestionRepository>(
        () => _i56.FirebaseQuestionFacade(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i57.PostCreateBloc>(() => _i57.PostCreateBloc(
          gh<_i51.IPostRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i58.CommunityCreatePostBloc>(() => _i58.CommunityCreatePostBloc(
          gh<_i40.ICommunityPostRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.lazySingleton<_i59.ICommunityCommentRepository>(
        () => _i60.FirebaseCommunityCommentFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
            ));
    gh.factory<_i61.CommentCreateBloc>(() => _i61.CommentCreateBloc(
          gh<_i52.ICommentRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.lazySingleton<_i62.ICommunityRepository>(
        () => _i63.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i64.RegisterWithEmailUC>(
        () => _i64.RegisterWithEmailUC(repository: gh<_i16.IAuthFacade>()));
    gh.factory<_i65.LoginWithEmailUC>(
        () => _i65.LoginWithEmailUC(repository: gh<_i16.IAuthFacade>()));
    gh.lazySingleton<_i66.IProfileInfoRepository>(
        () => _i67.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i68.CommunityDetailBloc>(
        () => _i68.CommunityDetailBloc(gh<_i62.ICommunityRepository>()));
    gh.factory<_i69.UpdateCommunityBloc>(
        () => _i69.UpdateCommunityBloc(gh<_i62.ICommunityRepository>()));
    gh.factory<_i70.SubscribeCommunityBloc>(
        () => _i70.SubscribeCommunityBloc(gh<_i62.ICommunityRepository>()));
    gh.factory<_i71.CommunityPostListBloc>(
        () => _i71.CommunityPostListBloc(gh<_i40.ICommunityPostRepository>()));
    gh.factory<_i72.ProfileInfoUpdateBloc>(() => _i72.ProfileInfoUpdateBloc(
          gh<_i66.IProfileInfoRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i73.AddQuestionBloc>(() => _i73.AddQuestionBloc(
          gh<_i55.IQuestionRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i74.GetAllChatsUseCase>(
        () => _i74.GetAllChatsUseCase(gh<_i33.IChatRepository>()));
    gh.factory<_i75.GetMessagesBloc>(
        () => _i75.GetMessagesBloc(gh<_i33.IChatRepository>()));
    gh.factory<_i76.GetAllChatsBloc>(
        () => _i76.GetAllChatsBloc(gh<_i33.IChatRepository>()));
    gh.factory<_i77.SeenMessageBloc>(
        () => _i77.SeenMessageBloc(gh<_i33.IChatRepository>()));
    gh.factory<_i78.CommunityProfileInfoBloc>(
        () => _i78.CommunityProfileInfoBloc(
              gh<_i19.IAuthFacade>(),
              gh<_i66.IProfileInfoRepository>(),
            ));
    gh.factory<_i79.PostLikeBloc>(() => _i79.PostLikeBloc(
          gh<_i51.IPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i80.CommunityPostDetailBloc>(() =>
        _i80.CommunityPostDetailBloc(gh<_i81.ICommunityPostRepository>()));
    gh.factory<_i82.MyCommunityListBloc>(() => _i82.MyCommunityListBloc(
          gh<_i62.ICommunityRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i83.PostUserListBloc>(
        () => _i83.PostUserListBloc(gh<_i38.IPostRepository>()));
    gh.factory<_i84.CommunityCreateBloc>(() => _i84.CommunityCreateBloc(
          gh<_i62.ICommunityRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i85.PostDetailBloc>(() => _i85.PostDetailBloc(
          gh<_i51.IPostRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i86.MyPostListBloc>(() => _i86.MyPostListBloc(
          gh<_i51.IPostRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i87.UpdateNewEmailBloc>(
        () => _i87.UpdateNewEmailBloc(gh<_i66.IProfileInfoRepository>()));
    gh.factory<_i88.GetAllQuestionBloc>(
        () => _i88.GetAllQuestionBloc(gh<_i55.IQuestionRepository>()));
    gh.factory<_i89.CommunityReplyCommentListBloc>(() =>
        _i89.CommunityReplyCommentListBloc(
            gh<_i59.ICommunityCommentRepository>()));
    gh.factory<_i90.CommunityCommentListBloc>(() =>
        _i90.CommunityCommentListBloc(gh<_i59.ICommunityCommentRepository>()));
    gh.factory<_i91.CommunityCommentLikesBloc>(() =>
        _i91.CommunityCommentLikesBloc(gh<_i59.ICommunityCommentRepository>()));
    gh.factory<_i92.AddReplyCommentBloc>(() => _i92.AddReplyCommentBloc(
          gh<_i52.ICommentRepository>(),
          gh<_i16.IAuthFacade>(),
          gh<_i7.ParentCommentIdBloc>(),
        ));
    gh.factory<_i93.ReplyCommentListBloc>(
        () => _i93.ReplyCommentListBloc(gh<_i52.ICommentRepository>()));
    gh.factory<_i94.CommentLikesBloc>(
        () => _i94.CommentLikesBloc(gh<_i52.ICommentRepository>()));
    gh.factory<_i95.CommentListBloc>(
        () => _i95.CommentListBloc(gh<_i52.ICommentRepository>()));
    gh.factory<_i96.CommunityAddReplyCommentBloc>(
        () => _i96.CommunityAddReplyCommentBloc(
              gh<_i59.ICommunityCommentRepository>(),
              gh<_i19.IAuthFacade>(),
              gh<_i7.ParentCommentIdBloc>(),
            ));
    gh.factory<_i97.CommunityListBloc>(
        () => _i97.CommunityListBloc(gh<_i62.ICommunityRepository>()));
    gh.factory<_i98.PostListBloc>(() => _i98.PostListBloc(
          gh<_i51.IPostRepository>(),
          gh<_i86.MyPostListBloc>(),
        ));
    gh.factory<_i99.SendMessageBloc>(() => _i99.SendMessageBloc(
          gh<_i33.IChatRepository>(),
          gh<_i75.GetMessagesBloc>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i100.CreateChatroomBloc>(() => _i100.CreateChatroomBloc(
          gh<_i33.IChatRepository>(),
          gh<_i75.GetMessagesBloc>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i101.CommunityCommentCreateBloc>(
        () => _i101.CommunityCommentCreateBloc(
              gh<_i59.ICommunityCommentRepository>(),
              gh<_i19.IAuthFacade>(),
              gh<_i90.CommunityCommentListBloc>(),
            ));
    return this;
  }
}

class _$FirebaseModule extends _i102.FirebaseModule {}
