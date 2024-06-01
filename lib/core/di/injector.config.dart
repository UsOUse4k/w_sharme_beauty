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
    as _i67;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i18;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i66;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart'
    as _i44;
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
    as _i80;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart'
    as _i108;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart'
    as _i82;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart'
    as _i81;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart'
    as _i83;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart'
    as _i107;
import 'package:w_sharme_beauty/features/chat_group/data/firebase_chat_group_facade.dart'
    as _i32;
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart'
    as _i31;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/added_chat_users_group_bloc/added_chat_users_group_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart'
    as _i9;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/create_chat_group_bloc/create_chat_group_bloc.dart'
    as _i48;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/filter_users_invite/filter_users_invite_bloc.dart'
    as _i13;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_admins_sorted_bloc/get_admins_sorted_bloc.dart'
    as _i12;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_admins_chat_group_bloc/get_all_admins_chat_group_bloc.dart'
    as _i37;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart'
    as _i45;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart'
    as _i51;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart'
    as _i36;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_people_chat_bloc/invite_people_chat_bloc.dart'
    as _i10;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_users_chat_group_bloc/invite_users_chat_group_bloc.dart'
    as _i49;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart'
    as _i46;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart'
    as _i35;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_chat_group_bloc/update_chat_group_bloc.dart'
    as _i47;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_manager_chat_group_bloc/update_manager_chat_group_bloc.dart'
    as _i50;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i55;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i54;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart'
    as _i99;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i63;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart'
    as _i103;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart'
    as _i104;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart'
    as _i102;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_comment_facade.dart'
    as _i62;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_post_repository.dart'
    as _i41;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_repository.dart'
    as _i65;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart'
    as _i61;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart'
    as _i40;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i64;
import 'package:w_sharme_beauty/features/communities/domain/repositories/repositories.dart'
    as _i87;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i56;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_add_reply_comment_bloc/community_add_reply_comment_bloc.dart'
    as _i105;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_category_bloc/community_category_bloc.dart'
    as _i15;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_create_bloc/community_comment_create_bloc.dart'
    as _i109;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_likes_bloc/community_comment_likes_bloc.dart'
    as _i98;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_list_bloc/community_comment_list_bloc.dart'
    as _i97;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i91;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart'
    as _i60;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart'
    as _i70;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i76;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_parent_comment_id_bloc/community_parent_commet_id_bloc.dart'
    as _i11;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_detail_bloc/community_post_detail_bloc.dart'
    as _i86;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart'
    as _i73;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart'
    as _i84;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_reply_comment_lidt_bloc/community_reply_comment_list_bloc.dart'
    as _i96;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/like_community_post_bloc/like_community_post_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart'
    as _i88;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/subscribe_community_bloc/subscribe_community_bloc.dart'
    as _i72;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/update_community_bloc/update_community_bloc.dart'
    as _i71;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i39;
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart'
    as _i38;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i53;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i93;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i59;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i92;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i85;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i106;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart'
    as _i90;
import 'package:w_sharme_beauty/features/post/presentation/bloc/subscribe_post/subscibe_post_bloc.dart'
    as _i52;
import 'package:w_sharme_beauty/features/profile/data/firebase_profile_facade.dart'
    as _i69;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i68;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/category_list_bloc/category_list_bloc.dart'
    as _i14;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i28;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i74;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/update_new_email_bloc/update_new_email_bloc.dart'
    as _i94;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart'
    as _i29;
import 'package:w_sharme_beauty/features/question/data/data/firebase_question_comment_facade.dart'
    as _i43;
import 'package:w_sharme_beauty/features/question/data/data/firebase_question_facade.dart'
    as _i58;
import 'package:w_sharme_beauty/features/question/domain/repositories/i_question_repository.dart'
    as _i57;
import 'package:w_sharme_beauty/features/question/domain/repositories/repositories.dart'
    as _i42;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/add_question_bloc.dart'
    as _i75;
import 'package:w_sharme_beauty/features/question/presentation/bloc/create_question_comment_bloc/create_question_comment_bloc.dart'
    as _i100;
import 'package:w_sharme_beauty/features/question/presentation/bloc/create_question_reply_comment_bloc/create_question_reply_comment_bloc.dart'
    as _i101;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_bloc/get_all_question_bloc.dart'
    as _i95;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_comments_bloc/get_all_question_comments_bloc.dart'
    as _i77;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_question_bloc/get_question_bloc.dart'
    as _i89;
import 'package:w_sharme_beauty/features/question/presentation/bloc/question_comment_like_bloc/question_comment_like_bloc.dart'
    as _i79;
import 'package:w_sharme_beauty/features/question/presentation/bloc/question_get_all_reply_comment_bloc/question_get_all_reply_comment_bloc.dart'
    as _i78;
import 'package:w_sharme_beauty/firebase_module.dart' as _i110;

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
    gh.lazySingleton<_i42.IQuestionCommentRepository>(
        () => _i43.FirebaseQuestionCommentFacade(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
            ));
    gh.factory<_i44.AuthBloc>(() => _i44.AuthBloc(gh<_i19.IAuthFacade>()));
    gh.factory<_i45.GetAllChatGroupBloc>(
        () => _i45.GetAllChatGroupBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i46.RemoveAdminChatGroupBloc>(
        () => _i46.RemoveAdminChatGroupBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i47.UpdateChatGroupBloc>(
        () => _i47.UpdateChatGroupBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i48.CreateChatGroupBloc>(
        () => _i48.CreateChatGroupBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i49.InviteUsersChatGroupBloc>(
        () => _i49.InviteUsersChatGroupBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i50.UpdateManagerChatGroupBloc>(
        () => _i50.UpdateManagerChatGroupBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i51.GetAllGroupMessagesBloc>(
        () => _i51.GetAllGroupMessagesBloc(gh<_i31.IChatGroupRepository>()));
    gh.factory<_i52.SubscibePostBloc>(() => _i52.SubscibePostBloc(
          gh<_i53.IPostRepository>(),
          gh<_i30.SubscribeBloc>(),
        ));
    gh.lazySingleton<_i54.ICommentRepository>(() => _i55.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i56.CommunityLikeBloc>(
        () => _i56.CommunityLikeBloc(gh<_i40.ICommunityPostRepository>()));
    gh.lazySingleton<_i57.IQuestionRepository>(
        () => _i58.FirebaseQuestionFacade(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i59.PostCreateBloc>(() => _i59.PostCreateBloc(
          gh<_i53.IPostRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i60.CommunityCreatePostBloc>(() => _i60.CommunityCreatePostBloc(
          gh<_i40.ICommunityPostRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.lazySingleton<_i61.ICommunityCommentRepository>(
        () => _i62.FirebaseCommunityCommentFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
            ));
    gh.factory<_i63.CommentCreateBloc>(() => _i63.CommentCreateBloc(
          gh<_i54.ICommentRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.lazySingleton<_i64.ICommunityRepository>(
        () => _i65.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i66.RegisterWithEmailUC>(
        () => _i66.RegisterWithEmailUC(repository: gh<_i16.IAuthFacade>()));
    gh.factory<_i67.LoginWithEmailUC>(
        () => _i67.LoginWithEmailUC(repository: gh<_i16.IAuthFacade>()));
    gh.lazySingleton<_i68.IProfileInfoRepository>(
        () => _i69.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i70.CommunityDetailBloc>(
        () => _i70.CommunityDetailBloc(gh<_i64.ICommunityRepository>()));
    gh.factory<_i71.UpdateCommunityBloc>(
        () => _i71.UpdateCommunityBloc(gh<_i64.ICommunityRepository>()));
    gh.factory<_i72.SubscribeCommunityBloc>(
        () => _i72.SubscribeCommunityBloc(gh<_i64.ICommunityRepository>()));
    gh.factory<_i73.CommunityPostListBloc>(
        () => _i73.CommunityPostListBloc(gh<_i40.ICommunityPostRepository>()));
    gh.factory<_i74.ProfileInfoUpdateBloc>(() => _i74.ProfileInfoUpdateBloc(
          gh<_i68.IProfileInfoRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i75.AddQuestionBloc>(() => _i75.AddQuestionBloc(
          gh<_i57.IQuestionRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i76.CommunityListBloc>(
        () => _i76.CommunityListBloc(gh<_i64.ICommunityRepository>()));
    gh.factory<_i77.GetAllQuestionCommentsBloc>(() =>
        _i77.GetAllQuestionCommentsBloc(gh<_i42.IQuestionCommentRepository>()));
    gh.factory<_i78.QuestionGetAllReplyCommentBloc>(() =>
        _i78.QuestionGetAllReplyCommentBloc(
            gh<_i42.IQuestionCommentRepository>()));
    gh.factory<_i79.QuestionCommentLikeBloc>(() =>
        _i79.QuestionCommentLikeBloc(gh<_i42.IQuestionCommentRepository>()));
    gh.factory<_i80.GetAllChatsUseCase>(
        () => _i80.GetAllChatsUseCase(gh<_i33.IChatRepository>()));
    gh.factory<_i81.GetMessagesBloc>(
        () => _i81.GetMessagesBloc(gh<_i33.IChatRepository>()));
    gh.factory<_i82.GetAllChatsBloc>(
        () => _i82.GetAllChatsBloc(gh<_i33.IChatRepository>()));
    gh.factory<_i83.SeenMessageBloc>(
        () => _i83.SeenMessageBloc(gh<_i33.IChatRepository>()));
    gh.factory<_i84.CommunityProfileInfoBloc>(
        () => _i84.CommunityProfileInfoBloc(
              gh<_i19.IAuthFacade>(),
              gh<_i68.IProfileInfoRepository>(),
            ));
    gh.factory<_i85.PostLikeBloc>(() => _i85.PostLikeBloc(
          gh<_i53.IPostRepository>(),
          gh<_i16.IAuthFacade>(),
        ));
    gh.factory<_i86.CommunityPostDetailBloc>(() =>
        _i86.CommunityPostDetailBloc(gh<_i87.ICommunityPostRepository>()));
    gh.factory<_i88.MyCommunityListBloc>(() => _i88.MyCommunityListBloc(
          gh<_i64.ICommunityRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i89.GetQuestionBloc>(
        () => _i89.GetQuestionBloc(gh<_i42.IQuestionRepository>()));
    gh.factory<_i90.PostUserListBloc>(
        () => _i90.PostUserListBloc(gh<_i38.IPostRepository>()));
    gh.factory<_i91.CommunityCreateBloc>(() => _i91.CommunityCreateBloc(
          gh<_i64.ICommunityRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i92.PostDetailBloc>(() => _i92.PostDetailBloc(
          gh<_i53.IPostRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i93.MyPostListBloc>(() => _i93.MyPostListBloc(
          gh<_i53.IPostRepository>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i94.UpdateNewEmailBloc>(
        () => _i94.UpdateNewEmailBloc(gh<_i68.IProfileInfoRepository>()));
    gh.factory<_i95.GetAllQuestionBloc>(
        () => _i95.GetAllQuestionBloc(gh<_i57.IQuestionRepository>()));
    gh.factory<_i96.CommunityReplyCommentListBloc>(() =>
        _i96.CommunityReplyCommentListBloc(
            gh<_i61.ICommunityCommentRepository>()));
    gh.factory<_i97.CommunityCommentListBloc>(() =>
        _i97.CommunityCommentListBloc(gh<_i61.ICommunityCommentRepository>()));
    gh.factory<_i98.CommunityCommentLikesBloc>(() =>
        _i98.CommunityCommentLikesBloc(gh<_i61.ICommunityCommentRepository>()));
    gh.factory<_i99.AddReplyCommentBloc>(() => _i99.AddReplyCommentBloc(
          gh<_i54.ICommentRepository>(),
          gh<_i16.IAuthFacade>(),
          gh<_i7.ParentCommentIdBloc>(),
        ));
    gh.factory<_i100.CreateQuestionCommentBloc>(
        () => _i100.CreateQuestionCommentBloc(
              gh<_i42.IQuestionCommentRepository>(),
              gh<_i19.IAuthFacade>(),
            ));
    gh.factory<_i101.CreateQuestionReplyCommentBloc>(
        () => _i101.CreateQuestionReplyCommentBloc(
              gh<_i42.IQuestionCommentRepository>(),
              gh<_i19.IAuthFacade>(),
            ));
    gh.factory<_i102.ReplyCommentListBloc>(
        () => _i102.ReplyCommentListBloc(gh<_i54.ICommentRepository>()));
    gh.factory<_i103.CommentLikesBloc>(
        () => _i103.CommentLikesBloc(gh<_i54.ICommentRepository>()));
    gh.factory<_i104.CommentListBloc>(
        () => _i104.CommentListBloc(gh<_i54.ICommentRepository>()));
    gh.factory<_i105.CommunityAddReplyCommentBloc>(
        () => _i105.CommunityAddReplyCommentBloc(
              gh<_i61.ICommunityCommentRepository>(),
              gh<_i19.IAuthFacade>(),
              gh<_i7.ParentCommentIdBloc>(),
            ));
    gh.factory<_i106.PostListBloc>(() => _i106.PostListBloc(
          gh<_i53.IPostRepository>(),
          gh<_i93.MyPostListBloc>(),
        ));
    gh.factory<_i107.SendMessageBloc>(() => _i107.SendMessageBloc(
          gh<_i33.IChatRepository>(),
          gh<_i81.GetMessagesBloc>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i108.CreateChatroomBloc>(() => _i108.CreateChatroomBloc(
          gh<_i33.IChatRepository>(),
          gh<_i81.GetMessagesBloc>(),
          gh<_i19.IAuthFacade>(),
        ));
    gh.factory<_i109.CommunityCommentCreateBloc>(
        () => _i109.CommunityCommentCreateBloc(
              gh<_i61.ICommunityCommentRepository>(),
              gh<_i19.IAuthFacade>(),
              gh<_i97.CommunityCommentListBloc>(),
            ));
    return this;
  }
}

class _$FirebaseModule extends _i110.FirebaseModule {}
