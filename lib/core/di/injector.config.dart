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
    as _i28;
import 'package:w_sharme_beauty/features/adverts/domain/repositories/i_advert_repository.dart'
    as _i27;
import 'package:w_sharme_beauty/features/auth/data/firebase_auth_facade.dart'
    as _i16;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart'
    as _i18;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i15;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i66;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i17;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i65;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart'
    as _i40;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart'
    as _i23;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/subscribe_bloc/subscribe_bloc.dart'
    as _i25;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart'
    as _i24;
import 'package:w_sharme_beauty/features/category/data/firebase_category_facade.dart'
    as _i20;
import 'package:w_sharme_beauty/features/category/domain/repositories/i_category_repository.dart'
    as _i19;
import 'package:w_sharme_beauty/features/category/presentation/bloc/category_bloc/category_bloc.dart'
    as _i21;
import 'package:w_sharme_beauty/features/chat/data/firebase_chat_facade.dart'
    as _i32;
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart'
    as _i31;
import 'package:w_sharme_beauty/features/chat/domain/use_cases/get_all_chats_use_cases.dart'
    as _i75;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart'
    as _i98;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart'
    as _i77;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart'
    as _i76;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart'
    as _i78;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart'
    as _i97;
import 'package:w_sharme_beauty/features/chat_group/data/firebase_chat_group_facade.dart'
    as _i30;
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart'
    as _i29;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/added_chat_users_group_bloc/added_chat_users_group_bloc.dart'
    as _i9;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart'
    as _i10;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/create_chat_group_bloc/create_chat_group_bloc.dart'
    as _i44;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/filter_users_invite/filter_users_invite_bloc.dart'
    as _i13;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_admins_sorted_bloc/get_admins_sorted_bloc.dart'
    as _i12;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_admins_chat_group_bloc/get_all_admins_chat_group_bloc.dart'
    as _i35;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart'
    as _i41;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart'
    as _i47;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart'
    as _i34;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_people_chat_bloc/invite_people_chat_bloc.dart'
    as _i11;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_users_chat_group_bloc/invite_users_chat_group_bloc.dart'
    as _i45;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart'
    as _i42;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart'
    as _i33;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_chat_group_bloc/update_chat_group_bloc.dart'
    as _i43;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_manager_chat_group_bloc/update_manager_chat_group_bloc.dart'
    as _i46;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i51;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i50;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart'
    as _i90;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i59;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart'
    as _i93;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart'
    as _i94;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart'
    as _i92;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_comment_facade.dart'
    as _i58;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_post_repository.dart'
    as _i39;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_repository.dart'
    as _i63;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart'
    as _i57;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart'
    as _i38;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i62;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i52;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_add_reply_comment_bloc/community_add_reply_comment_bloc.dart'
    as _i91;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_create_bloc/community_comment_create_bloc.dart'
    as _i99;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_likes_bloc/community_comment_likes_bloc.dart'
    as _i89;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_list_bloc/community_comment_list_bloc.dart'
    as _i88;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i83;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart'
    as _i56;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart'
    as _i69;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i74;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_parent_comment_id_bloc/community_parent_commet_id_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart'
    as _i72;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart'
    as _i79;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_reply_comment_lidt_bloc/community_reply_comment_list_bloc.dart'
    as _i87;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/like_community_post_bloc/like_community_post_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart'
    as _i81;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/subscribe_community_bloc/subscribe_community_bloc.dart'
    as _i71;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/update_community_bloc/update_community_bloc.dart'
    as _i70;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i37;
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart'
    as _i36;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i49;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i85;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i55;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i84;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i80;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i96;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart'
    as _i82;
import 'package:w_sharme_beauty/features/post/presentation/bloc/subscribe_post/subscibe_post_bloc.dart'
    as _i48;
import 'package:w_sharme_beauty/features/profile/data/firebase_profile_facade.dart'
    as _i68;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i67;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/category_list_bloc/category_list_bloc.dart'
    as _i14;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i22;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i73;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/update_new_email_bloc/update_new_email_bloc.dart'
    as _i86;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart'
    as _i26;
import 'package:w_sharme_beauty/features/question/data/data/firebase_add_question_data.dart'
    as _i61;
import 'package:w_sharme_beauty/features/question/data/data/firebase_get_question_facade.dart'
    as _i54;
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart'
    as _i60;
import 'package:w_sharme_beauty/features/question/domain/repositories/i_question_repository.dart'
    as _i53;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/add_question_bloc.dart'
    as _i64;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_bloc/get_all_question_bloc.dart'
    as _i95;
import 'package:w_sharme_beauty/firebase_module.dart' as _i100;

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
    gh.factory<_i6.CommunityParentCommetIdBloc>(
        () => _i6.CommunityParentCommetIdBloc());
    gh.factory<_i7.ParentCommentIdBloc>(() => _i7.ParentCommentIdBloc());
    gh.factory<_i8.LikeCommunityPostBloc>(() => _i8.LikeCommunityPostBloc());
    gh.factory<_i9.AddedChatUsersGroupBloc>(
        () => _i9.AddedChatUsersGroupBloc());
    gh.factory<_i10.ChatGroupCheckManagerBloc>(
        () => _i10.ChatGroupCheckManagerBloc());
    gh.factory<_i11.InvitePeopleChatBloc>(() => _i11.InvitePeopleChatBloc());
    gh.factory<_i12.GetAdminsSortedBloc>(() => _i12.GetAdminsSortedBloc());
    gh.factory<_i13.FilterUsersInviteBloc>(() => _i13.FilterUsersInviteBloc());
    gh.factory<_i14.CategoryListBloc>(() => _i14.CategoryListBloc());
    gh.lazySingleton<_i15.IAuthFacade>(() => _i16.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i17.LogoutUC>(
        () => _i17.LogoutUC(repository: gh<_i18.IAuthFacade>()));
    gh.lazySingleton<_i19.ICategoryRepository>(
        () => _i20.FirebaseCategoryFacade(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i21.CategoryBloc>(
        () => _i21.CategoryBloc(gh<_i19.ICategoryRepository>()));
    gh.factory<_i22.MyProfileInfoBloc>(
        () => _i22.MyProfileInfoBloc(gh<_i18.IAuthFacade>()));
    gh.factory<_i23.GetAllUsersBloc>(
        () => _i23.GetAllUsersBloc(gh<_i18.IAuthFacade>()));
    gh.factory<_i24.UpdateStatusUserBloc>(
        () => _i24.UpdateStatusUserBloc(gh<_i18.IAuthFacade>()));
    gh.factory<_i25.SubscribeBloc>(
        () => _i25.SubscribeBloc(gh<_i18.IAuthFacade>()));
    gh.factory<_i26.UserDetailBloc>(
        () => _i26.UserDetailBloc(gh<_i18.IAuthFacade>()));
    gh.lazySingleton<_i27.IAdvartRepository>(
        () => _i28.FirebaseCreateAdvartRepository(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i29.IChatGroupRepository>(
        () => _i30.FirebaseChatGroupFacade(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i31.IChatRepository>(() => _i32.FirebaseChatFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i33.SendMessageGroupBloc>(() => _i33.SendMessageGroupBloc(
          gh<_i29.IChatGroupRepository>(),
          gh<_i18.IAuthFacade>(),
        ));
    gh.factory<_i34.GetGroupBloc>(() => _i34.GetGroupBloc(
          gh<_i29.IChatGroupRepository>(),
          gh<_i18.IAuthFacade>(),
        ));
    gh.factory<_i35.GetAllAdminsChatGroupBloc>(
        () => _i35.GetAllAdminsChatGroupBloc(
              gh<_i29.IChatGroupRepository>(),
              gh<_i18.IAuthFacade>(),
            ));
    gh.lazySingleton<_i36.IPostRepository>(() => _i37.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i38.ICommunityPostRepository>(
        () => _i39.FirestorePostRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i40.AuthBloc>(() => _i40.AuthBloc(gh<_i18.IAuthFacade>()));
    gh.factory<_i41.GetAllChatGroupBloc>(
        () => _i41.GetAllChatGroupBloc(gh<_i29.IChatGroupRepository>()));
    gh.factory<_i42.RemoveAdminChatGroupBloc>(
        () => _i42.RemoveAdminChatGroupBloc(gh<_i29.IChatGroupRepository>()));
    gh.factory<_i43.UpdateChatGroupBloc>(
        () => _i43.UpdateChatGroupBloc(gh<_i29.IChatGroupRepository>()));
    gh.factory<_i44.CreateChatGroupBloc>(
        () => _i44.CreateChatGroupBloc(gh<_i29.IChatGroupRepository>()));
    gh.factory<_i45.InviteUsersChatGroupBloc>(
        () => _i45.InviteUsersChatGroupBloc(gh<_i29.IChatGroupRepository>()));
    gh.factory<_i46.UpdateManagerChatGroupBloc>(
        () => _i46.UpdateManagerChatGroupBloc(gh<_i29.IChatGroupRepository>()));
    gh.factory<_i47.GetAllGroupMessagesBloc>(
        () => _i47.GetAllGroupMessagesBloc(gh<_i29.IChatGroupRepository>()));
    gh.factory<_i48.SubscibePostBloc>(() => _i48.SubscibePostBloc(
          gh<_i49.IPostRepository>(),
          gh<_i25.SubscribeBloc>(),
        ));
    gh.lazySingleton<_i50.ICommentRepository>(() => _i51.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i52.CommunityLikeBloc>(
        () => _i52.CommunityLikeBloc(gh<_i38.ICommunityPostRepository>()));
    gh.lazySingleton<_i53.IQuestionRepository>(
        () => _i54.FirestoreAddQuestionRepository(
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.factory<_i55.PostCreateBloc>(() => _i55.PostCreateBloc(
          gh<_i49.IPostRepository>(),
          gh<_i18.IAuthFacade>(),
        ));
    gh.factory<_i56.CommunityCreatePostBloc>(() => _i56.CommunityCreatePostBloc(
          gh<_i38.ICommunityPostRepository>(),
          gh<_i18.IAuthFacade>(),
        ));
    gh.lazySingleton<_i57.ICommunityCommentRepository>(
        () => _i58.FirebaseCommunityCommentFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
            ));
    gh.factory<_i59.CommentCreateBloc>(() => _i59.CommentCreateBloc(
          gh<_i50.ICommentRepository>(),
          gh<_i15.IAuthFacade>(),
        ));
    gh.lazySingleton<_i60.AddQuestionRepository>(
        () => _i61.FirestoreAddQuestionRepository(
              gh<_i15.IAuthFacade>(),
              firestore: gh<_i4.FirebaseFirestore>(),
              auth: gh<_i3.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i62.ICommunityRepository>(
        () => _i63.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i64.AddQuestionBloc>(() => _i64.AddQuestionBloc(
          gh<_i60.AddQuestionRepository>(),
          gh<_i18.IAuthFacade>(),
        ));
    gh.factory<_i65.RegisterWithEmailUC>(
        () => _i65.RegisterWithEmailUC(repository: gh<_i15.IAuthFacade>()));
    gh.factory<_i66.LoginWithEmailUC>(
        () => _i66.LoginWithEmailUC(repository: gh<_i15.IAuthFacade>()));
    gh.lazySingleton<_i67.IProfileInfoRepository>(
        () => _i68.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i69.CommunityDetailBloc>(
        () => _i69.CommunityDetailBloc(gh<_i62.ICommunityRepository>()));
    gh.factory<_i70.UpdateCommunityBloc>(
        () => _i70.UpdateCommunityBloc(gh<_i62.ICommunityRepository>()));
    gh.factory<_i71.SubscribeCommunityBloc>(
        () => _i71.SubscribeCommunityBloc(gh<_i62.ICommunityRepository>()));
    gh.factory<_i72.CommunityPostListBloc>(
        () => _i72.CommunityPostListBloc(gh<_i38.ICommunityPostRepository>()));
    gh.factory<_i73.ProfileInfoUpdateBloc>(() => _i73.ProfileInfoUpdateBloc(
          gh<_i67.IProfileInfoRepository>(),
          gh<_i15.IAuthFacade>(),
        ));
    gh.factory<_i74.CommunityListBloc>(
        () => _i74.CommunityListBloc(gh<_i62.ICommunityRepository>()));
    gh.factory<_i75.GetAllChatsUseCase>(
        () => _i75.GetAllChatsUseCase(gh<_i31.IChatRepository>()));
    gh.factory<_i76.GetMessagesBloc>(
        () => _i76.GetMessagesBloc(gh<_i31.IChatRepository>()));
    gh.factory<_i77.GetAllChatsBloc>(
        () => _i77.GetAllChatsBloc(gh<_i31.IChatRepository>()));
    gh.factory<_i78.SeenMessageBloc>(
        () => _i78.SeenMessageBloc(gh<_i31.IChatRepository>()));
    gh.factory<_i79.CommunityProfileInfoBloc>(
        () => _i79.CommunityProfileInfoBloc(
              gh<_i18.IAuthFacade>(),
              gh<_i67.IProfileInfoRepository>(),
            ));
    gh.factory<_i80.PostLikeBloc>(() => _i80.PostLikeBloc(
          gh<_i49.IPostRepository>(),
          gh<_i15.IAuthFacade>(),
        ));
    gh.factory<_i81.MyCommunityListBloc>(() => _i81.MyCommunityListBloc(
          gh<_i62.ICommunityRepository>(),
          gh<_i18.IAuthFacade>(),
        ));
    gh.factory<_i82.PostUserListBloc>(
        () => _i82.PostUserListBloc(gh<_i36.IPostRepository>()));
    gh.factory<_i83.CommunityCreateBloc>(() => _i83.CommunityCreateBloc(
          gh<_i62.ICommunityRepository>(),
          gh<_i18.IAuthFacade>(),
        ));
    gh.factory<_i84.PostDetailBloc>(() => _i84.PostDetailBloc(
          gh<_i49.IPostRepository>(),
          gh<_i18.IAuthFacade>(),
        ));
    gh.factory<_i85.MyPostListBloc>(() => _i85.MyPostListBloc(
          gh<_i49.IPostRepository>(),
          gh<_i18.IAuthFacade>(),
        ));
    gh.factory<_i86.UpdateNewEmailBloc>(
        () => _i86.UpdateNewEmailBloc(gh<_i67.IProfileInfoRepository>()));
    gh.factory<_i87.CommunityReplyCommentListBloc>(() =>
        _i87.CommunityReplyCommentListBloc(
            gh<_i57.ICommunityCommentRepository>()));
    gh.factory<_i88.CommunityCommentListBloc>(() =>
        _i88.CommunityCommentListBloc(gh<_i57.ICommunityCommentRepository>()));
    gh.factory<_i89.CommunityCommentLikesBloc>(() =>
        _i89.CommunityCommentLikesBloc(gh<_i57.ICommunityCommentRepository>()));
    gh.factory<_i90.AddReplyCommentBloc>(() => _i90.AddReplyCommentBloc(
          gh<_i50.ICommentRepository>(),
          gh<_i15.IAuthFacade>(),
          gh<_i7.ParentCommentIdBloc>(),
        ));
    gh.factory<_i91.CommunityAddReplyCommentBloc>(
        () => _i91.CommunityAddReplyCommentBloc(
              gh<_i57.ICommunityCommentRepository>(),
              gh<_i18.IAuthFacade>(),
              gh<_i87.CommunityReplyCommentListBloc>(),
              gh<_i7.ParentCommentIdBloc>(),
            ));
    gh.factory<_i92.ReplyCommentListBloc>(
        () => _i92.ReplyCommentListBloc(gh<_i50.ICommentRepository>()));
    gh.factory<_i93.CommentLikesBloc>(
        () => _i93.CommentLikesBloc(gh<_i50.ICommentRepository>()));
    gh.factory<_i94.CommentListBloc>(
        () => _i94.CommentListBloc(gh<_i50.ICommentRepository>()));
    gh.factory<_i95.GetAllQuestionBloc>(
        () => _i95.GetAllQuestionBloc(gh<_i53.IQuestionRepository>()));
    gh.factory<_i96.PostListBloc>(() => _i96.PostListBloc(
          gh<_i49.IPostRepository>(),
          gh<_i85.MyPostListBloc>(),
        ));
    gh.factory<_i97.SendMessageBloc>(() => _i97.SendMessageBloc(
          gh<_i31.IChatRepository>(),
          gh<_i76.GetMessagesBloc>(),
          gh<_i18.IAuthFacade>(),
        ));
    gh.factory<_i98.CreateChatroomBloc>(() => _i98.CreateChatroomBloc(
          gh<_i31.IChatRepository>(),
          gh<_i76.GetMessagesBloc>(),
          gh<_i18.IAuthFacade>(),
        ));
    gh.factory<_i99.CommunityCommentCreateBloc>(
        () => _i99.CommunityCommentCreateBloc(
              gh<_i57.ICommunityCommentRepository>(),
              gh<_i18.IAuthFacade>(),
              gh<_i88.CommunityCommentListBloc>(),
            ));
    return this;
  }
}

class _$FirebaseModule extends _i100.FirebaseModule {}
