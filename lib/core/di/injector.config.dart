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
import 'package:w_sharme_beauty/features/adverts/data/firebase_advert_repository.dart'
    as _i39;
import 'package:w_sharme_beauty/features/adverts/domain/i_advert_repository.dart'
    as _i38;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/add_service/add_service_cubit.dart'
    as _i13;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts/adverts_cubit.dart'
    as _i102;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts_filter/adverts_filter_cubit.dart'
    as _i23;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/create_advert/create_advert_cubit.dart'
    as _i94;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/create_reply/create_reply_cubit.dart'
    as _i90;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/create_review/create_review_cubit.dart'
    as _i88;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/delete_advert/delete_advert_cubit.dart'
    as _i92;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/edit_advert/edit_advert_cubit.dart'
    as _i87;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/edit_service/edit_service_cubit.dart'
    as _i11;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/my_adverts/my_adverts_cubit.dart'
    as _i48;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/replies/replies_cubit.dart'
    as _i89;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/reviews/reviews_cubit.dart'
    as _i93;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/search_adverts/search_adverts_cubit.dart'
    as _i91;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/search_results/search_results_cubit.dart'
    as _i12;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/select_categories/select_categories_cubit.dart'
    as _i14;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/select_schedule/select_schedule_cubit.dart'
    as _i15;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/select_services/select_services_cubit.dart'
    as _i10;
import 'package:w_sharme_beauty/features/auth/data/firebase_auth_facade.dart'
    as _i25;
import 'package:w_sharme_beauty/features/auth/data/firebase_notifcication_facade.dart'
    as _i54;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart'
    as _i27;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_notification.dart'
    as _i53;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i24;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i78;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i26;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i77;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart'
    as _i55;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/create_notification_bloc/create_notification_bloc.dart'
    as _i122;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_notification_bloc/get_all_notification_bloc.dart'
    as _i103;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart'
    as _i31;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/subscribe_bloc/subscribe_bloc.dart'
    as _i33;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart'
    as _i32;
import 'package:w_sharme_beauty/features/category/data/firebase_category_facade.dart'
    as _i29;
import 'package:w_sharme_beauty/features/category/domain/repositories/i_category_repository.dart'
    as _i28;
import 'package:w_sharme_beauty/features/category/presentation/bloc/category_bloc/category_bloc.dart'
    as _i30;
import 'package:w_sharme_beauty/features/chat/data/firebase_chat_facade.dart'
    as _i41;
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart'
    as _i40;
import 'package:w_sharme_beauty/features/chat/domain/use_cases/get_all_chats_use_cases.dart'
    as _i98;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart'
    as _i130;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart'
    as _i100;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart'
    as _i99;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart'
    as _i101;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart'
    as _i129;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_post_bloc/send_post_bloc.dart'
    as _i45;
import 'package:w_sharme_beauty/features/chat_group/data/firebase_chat_group_facade.dart'
    as _i37;
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart'
    as _i36;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/added_chat_users_group_bloc/added_chat_users_group_bloc.dart'
    as _i16;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart'
    as _i19;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/create_chat_group_bloc/create_chat_group_bloc.dart'
    as _i59;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/filter_users_invite/filter_users_invite_bloc.dart'
    as _i18;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_admins_sorted_bloc/get_admins_sorted_bloc.dart'
    as _i17;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_admins_chat_group_bloc/get_all_admins_chat_group_bloc.dart'
    as _i44;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart'
    as _i56;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart'
    as _i62;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart'
    as _i43;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_people_chat_bloc/invite_people_chat_bloc.dart'
    as _i20;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_users_chat_group_bloc/invite_users_chat_group_bloc.dart'
    as _i60;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart'
    as _i57;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart'
    as _i42;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_chat_group_bloc/update_chat_group_bloc.dart'
    as _i58;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_manager_chat_group_bloc/update_manager_chat_group_bloc.dart'
    as _i61;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i66;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i65;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart'
    as _i119;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i74;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart'
    as _i124;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart'
    as _i125;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart'
    as _i9;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart'
    as _i123;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_comment_facade.dart'
    as _i73;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_post_repository.dart'
    as _i50;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_repository.dart'
    as _i76;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart'
    as _i72;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart'
    as _i49;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i75;
import 'package:w_sharme_beauty/features/communities/domain/repositories/repositories.dart'
    as _i107;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i67;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_add_reply_comment_bloc/community_add_reply_comment_bloc.dart'
    as _i126;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_category_bloc/community_category_bloc.dart'
    as _i6;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_create_bloc/community_comment_create_bloc.dart'
    as _i131;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_likes_bloc/community_comment_likes_bloc.dart'
    as _i118;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_list_bloc/community_comment_list_bloc.dart'
    as _i117;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i111;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart'
    as _i71;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart'
    as _i81;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i127;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_parent_comment_id_bloc/community_parent_commet_id_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_detail_bloc/community_post_detail_bloc.dart'
    as _i106;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart'
    as _i84;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart'
    as _i104;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_reply_comment_lidt_bloc/community_reply_comment_list_bloc.dart'
    as _i116;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/like_community_post_bloc/like_community_post_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart'
    as _i108;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/subscribe_community_bloc/subscribe_community_bloc.dart'
    as _i83;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/update_community_bloc/update_community_bloc.dart'
    as _i82;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i47;
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart'
    as _i46;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i64;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i113;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i70;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i112;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i105;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i128;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart'
    as _i110;
import 'package:w_sharme_beauty/features/post/presentation/bloc/repost_users_bloc/repost_users_bloc.dart'
    as _i22;
import 'package:w_sharme_beauty/features/post/presentation/bloc/subscribe_post/subscibe_post_bloc.dart'
    as _i63;
import 'package:w_sharme_beauty/features/profile/data/firebase_profile_facade.dart'
    as _i80;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i79;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/category_list_bloc/category_list_bloc.dart'
    as _i21;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i34;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i85;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/update_new_email_bloc/update_new_email_bloc.dart'
    as _i115;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart'
    as _i35;
import 'package:w_sharme_beauty/features/question/data/data/firebase_question_comment_facade.dart'
    as _i52;
import 'package:w_sharme_beauty/features/question/data/data/firebase_question_facade.dart'
    as _i69;
import 'package:w_sharme_beauty/features/question/domain/repositories/i_question_repository.dart'
    as _i68;
import 'package:w_sharme_beauty/features/question/domain/repositories/repositories.dart'
    as _i51;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/add_question_bloc.dart'
    as _i86;
import 'package:w_sharme_beauty/features/question/presentation/bloc/create_question_comment_bloc/create_question_comment_bloc.dart'
    as _i120;
import 'package:w_sharme_beauty/features/question/presentation/bloc/create_question_reply_comment_bloc/create_question_reply_comment_bloc.dart'
    as _i121;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_bloc/get_all_question_bloc.dart'
    as _i114;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_comments_bloc/get_all_question_comments_bloc.dart'
    as _i95;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_question_bloc/get_question_bloc.dart'
    as _i109;
import 'package:w_sharme_beauty/features/question/presentation/bloc/question_comment_like_bloc/question_comment_like_bloc.dart'
    as _i97;
import 'package:w_sharme_beauty/features/question/presentation/bloc/question_get_all_reply_comment_bloc/question_get_all_reply_comment_bloc.dart'
    as _i96;
import 'package:w_sharme_beauty/firebase_module.dart' as _i132;

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
    gh.factory<_i6.CommunityCategoryBloc>(() => _i6.CommunityCategoryBloc());
    gh.factory<_i7.LikeCommunityPostBloc>(() => _i7.LikeCommunityPostBloc());
    gh.factory<_i8.CommunityParentCommetIdBloc>(
        () => _i8.CommunityParentCommetIdBloc());
    gh.factory<_i9.ParentCommentIdBloc>(() => _i9.ParentCommentIdBloc());
    gh.factory<_i10.SelectServicesCubit>(() => _i10.SelectServicesCubit());
    gh.factory<_i11.EditServiceCubit>(() => _i11.EditServiceCubit());
    gh.factory<_i12.SearchResultsCubit>(() => _i12.SearchResultsCubit());
    gh.factory<_i13.AddServiceCubit>(() => _i13.AddServiceCubit());
    gh.factory<_i14.SelectCategoriesCubit>(() => _i14.SelectCategoriesCubit());
    gh.factory<_i15.SelectScheduleCubit>(() => _i15.SelectScheduleCubit());
    gh.factory<_i16.AddedChatUsersGroupBloc>(
        () => _i16.AddedChatUsersGroupBloc());
    gh.factory<_i17.GetAdminsSortedBloc>(() => _i17.GetAdminsSortedBloc());
    gh.factory<_i18.FilterUsersInviteBloc>(() => _i18.FilterUsersInviteBloc());
    gh.factory<_i19.ChatGroupCheckManagerBloc>(
        () => _i19.ChatGroupCheckManagerBloc());
    gh.factory<_i20.InvitePeopleChatBloc>(() => _i20.InvitePeopleChatBloc());
    gh.factory<_i21.CategoryListBloc>(() => _i21.CategoryListBloc());
    gh.factory<_i22.RepostUsersBloc>(() => _i22.RepostUsersBloc());
    gh.lazySingleton<_i23.AdvertsFilterCubit>(() => _i23.AdvertsFilterCubit());
    gh.lazySingleton<_i24.IAuthFacade>(() => _i25.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i26.LogoutUC>(
        () => _i26.LogoutUC(repository: gh<_i27.IAuthFacade>()));
    gh.lazySingleton<_i28.ICategoryRepository>(
        () => _i29.FirebaseCategoryFacade(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i30.CategoryBloc>(
        () => _i30.CategoryBloc(gh<_i28.ICategoryRepository>()));
    gh.factory<_i31.GetAllUsersBloc>(
        () => _i31.GetAllUsersBloc(gh<_i27.IAuthFacade>()));
    gh.factory<_i32.UpdateStatusUserBloc>(
        () => _i32.UpdateStatusUserBloc(gh<_i27.IAuthFacade>()));
    gh.factory<_i33.SubscribeBloc>(
        () => _i33.SubscribeBloc(gh<_i27.IAuthFacade>()));
    gh.factory<_i34.MyProfileInfoBloc>(
        () => _i34.MyProfileInfoBloc(gh<_i27.IAuthFacade>()));
    gh.factory<_i35.UserDetailBloc>(
        () => _i35.UserDetailBloc(gh<_i27.IAuthFacade>()));
    gh.lazySingleton<_i36.IChatGroupRepository>(
        () => _i37.FirebaseChatGroupFacade(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i38.IAdvertRepository>(
        () => _i39.FirebaseAdvertRepository(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i40.IChatRepository>(() => _i41.FirebaseChatFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i42.SendMessageGroupBloc>(() => _i42.SendMessageGroupBloc(
          gh<_i36.IChatGroupRepository>(),
          gh<_i27.IAuthFacade>(),
        ));
    gh.factory<_i43.GetGroupBloc>(() => _i43.GetGroupBloc(
          gh<_i36.IChatGroupRepository>(),
          gh<_i27.IAuthFacade>(),
        ));
    gh.factory<_i44.GetAllAdminsChatGroupBloc>(
        () => _i44.GetAllAdminsChatGroupBloc(
              gh<_i36.IChatGroupRepository>(),
              gh<_i27.IAuthFacade>(),
            ));
    gh.factory<_i45.SendPostBloc>(() => _i45.SendPostBloc(
          gh<_i40.IChatRepository>(),
          gh<_i27.IAuthFacade>(),
        ));
    gh.lazySingleton<_i46.IPostRepository>(() => _i47.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i48.MyAdvertsCubit>(
        () => _i48.MyAdvertsCubit(gh<_i38.IAdvertRepository>()));
    gh.lazySingleton<_i49.ICommunityPostRepository>(
        () => _i50.FirestorePostRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i51.IQuestionCommentRepository>(
        () => _i52.FirebaseQuestionCommentFacade(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
            ));
    gh.lazySingleton<_i53.INotification>(() => _i54.FirebaseNotification(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i55.AuthBloc>(() => _i55.AuthBloc(gh<_i27.IAuthFacade>()));
    gh.factory<_i56.GetAllChatGroupBloc>(
        () => _i56.GetAllChatGroupBloc(gh<_i36.IChatGroupRepository>()));
    gh.factory<_i57.RemoveAdminChatGroupBloc>(
        () => _i57.RemoveAdminChatGroupBloc(gh<_i36.IChatGroupRepository>()));
    gh.factory<_i58.UpdateChatGroupBloc>(
        () => _i58.UpdateChatGroupBloc(gh<_i36.IChatGroupRepository>()));
    gh.factory<_i59.CreateChatGroupBloc>(
        () => _i59.CreateChatGroupBloc(gh<_i36.IChatGroupRepository>()));
    gh.factory<_i60.InviteUsersChatGroupBloc>(
        () => _i60.InviteUsersChatGroupBloc(gh<_i36.IChatGroupRepository>()));
    gh.factory<_i61.UpdateManagerChatGroupBloc>(
        () => _i61.UpdateManagerChatGroupBloc(gh<_i36.IChatGroupRepository>()));
    gh.factory<_i62.GetAllGroupMessagesBloc>(
        () => _i62.GetAllGroupMessagesBloc(gh<_i36.IChatGroupRepository>()));
    gh.factory<_i63.SubscibePostBloc>(() => _i63.SubscibePostBloc(
          gh<_i64.IPostRepository>(),
          gh<_i33.SubscribeBloc>(),
        ));
    gh.lazySingleton<_i65.ICommentRepository>(() => _i66.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i67.CommunityLikeBloc>(
        () => _i67.CommunityLikeBloc(gh<_i49.ICommunityPostRepository>()));
    gh.lazySingleton<_i68.IQuestionRepository>(
        () => _i69.FirebaseQuestionFacade(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i70.PostCreateBloc>(() => _i70.PostCreateBloc(
          gh<_i64.IPostRepository>(),
          gh<_i27.IAuthFacade>(),
        ));
    gh.factory<_i71.CommunityCreatePostBloc>(() => _i71.CommunityCreatePostBloc(
          gh<_i49.ICommunityPostRepository>(),
          gh<_i27.IAuthFacade>(),
        ));
    gh.lazySingleton<_i72.ICommunityCommentRepository>(
        () => _i73.FirebaseCommunityCommentFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
            ));
    gh.factory<_i74.CommentCreateBloc>(() => _i74.CommentCreateBloc(
          gh<_i65.ICommentRepository>(),
          gh<_i24.IAuthFacade>(),
        ));
    gh.lazySingleton<_i75.ICommunityRepository>(
        () => _i76.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i77.RegisterWithEmailUC>(
        () => _i77.RegisterWithEmailUC(repository: gh<_i24.IAuthFacade>()));
    gh.factory<_i78.LoginWithEmailUC>(
        () => _i78.LoginWithEmailUC(repository: gh<_i24.IAuthFacade>()));
    gh.lazySingleton<_i79.IProfileInfoRepository>(
        () => _i80.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i81.CommunityDetailBloc>(
        () => _i81.CommunityDetailBloc(gh<_i75.ICommunityRepository>()));
    gh.factory<_i82.UpdateCommunityBloc>(
        () => _i82.UpdateCommunityBloc(gh<_i75.ICommunityRepository>()));
    gh.factory<_i83.SubscribeCommunityBloc>(
        () => _i83.SubscribeCommunityBloc(gh<_i75.ICommunityRepository>()));
    gh.factory<_i84.CommunityPostListBloc>(
        () => _i84.CommunityPostListBloc(gh<_i49.ICommunityPostRepository>()));
    gh.factory<_i85.ProfileInfoUpdateBloc>(() => _i85.ProfileInfoUpdateBloc(
          gh<_i79.IProfileInfoRepository>(),
          gh<_i24.IAuthFacade>(),
        ));
    gh.factory<_i86.AddQuestionBloc>(() => _i86.AddQuestionBloc(
          gh<_i68.IQuestionRepository>(),
          gh<_i27.IAuthFacade>(),
        ));
    gh.factory<_i87.EditAdvertCubit>(
        () => _i87.EditAdvertCubit(gh<_i38.IAdvertRepository>()));
    gh.factory<_i88.CreateReviewCubit>(
        () => _i88.CreateReviewCubit(gh<_i38.IAdvertRepository>()));
    gh.factory<_i89.RepliesCubit>(
        () => _i89.RepliesCubit(gh<_i38.IAdvertRepository>()));
    gh.factory<_i90.CreateReplyCubit>(
        () => _i90.CreateReplyCubit(gh<_i38.IAdvertRepository>()));
    gh.factory<_i91.SearchAdvertsCubit>(
        () => _i91.SearchAdvertsCubit(gh<_i38.IAdvertRepository>()));
    gh.factory<_i92.DeleteAdvertCubit>(
        () => _i92.DeleteAdvertCubit(gh<_i38.IAdvertRepository>()));
    gh.factory<_i93.ReviewsCubit>(
        () => _i93.ReviewsCubit(gh<_i38.IAdvertRepository>()));
    gh.factory<_i94.CreateAdvertCubit>(
        () => _i94.CreateAdvertCubit(gh<_i38.IAdvertRepository>()));
    gh.factory<_i95.GetAllQuestionCommentsBloc>(() =>
        _i95.GetAllQuestionCommentsBloc(gh<_i51.IQuestionCommentRepository>()));
    gh.factory<_i96.QuestionGetAllReplyCommentBloc>(() =>
        _i96.QuestionGetAllReplyCommentBloc(
            gh<_i51.IQuestionCommentRepository>()));
    gh.factory<_i97.QuestionCommentLikeBloc>(() =>
        _i97.QuestionCommentLikeBloc(gh<_i51.IQuestionCommentRepository>()));
    gh.factory<_i98.GetAllChatsUseCase>(
        () => _i98.GetAllChatsUseCase(gh<_i40.IChatRepository>()));
    gh.factory<_i99.GetMessagesBloc>(
        () => _i99.GetMessagesBloc(gh<_i40.IChatRepository>()));
    gh.factory<_i100.GetAllChatsBloc>(
        () => _i100.GetAllChatsBloc(gh<_i40.IChatRepository>()));
    gh.factory<_i101.SeenMessageBloc>(
        () => _i101.SeenMessageBloc(gh<_i40.IChatRepository>()));
    gh.factory<_i102.AdvertsCubit>(() => _i102.AdvertsCubit(
          gh<_i38.IAdvertRepository>(),
          gh<_i23.AdvertsFilterCubit>(),
        ));
    gh.factory<_i103.GetAllNotificationBloc>(
        () => _i103.GetAllNotificationBloc(gh<_i53.INotification>()));
    gh.factory<_i104.CommunityProfileInfoBloc>(
        () => _i104.CommunityProfileInfoBloc(
              gh<_i27.IAuthFacade>(),
              gh<_i79.IProfileInfoRepository>(),
            ));
    gh.factory<_i105.PostLikeBloc>(() => _i105.PostLikeBloc(
          gh<_i64.IPostRepository>(),
          gh<_i24.IAuthFacade>(),
        ));
    gh.factory<_i106.CommunityPostDetailBloc>(() =>
        _i106.CommunityPostDetailBloc(gh<_i107.ICommunityPostRepository>()));
    gh.factory<_i108.MyCommunityListBloc>(() => _i108.MyCommunityListBloc(
          gh<_i75.ICommunityRepository>(),
          gh<_i27.IAuthFacade>(),
        ));
    gh.factory<_i109.GetQuestionBloc>(
        () => _i109.GetQuestionBloc(gh<_i51.IQuestionRepository>()));
    gh.factory<_i110.PostUserListBloc>(
        () => _i110.PostUserListBloc(gh<_i46.IPostRepository>()));
    gh.factory<_i111.CommunityCreateBloc>(() => _i111.CommunityCreateBloc(
          gh<_i75.ICommunityRepository>(),
          gh<_i27.IAuthFacade>(),
        ));
    gh.factory<_i112.PostDetailBloc>(() => _i112.PostDetailBloc(
          gh<_i64.IPostRepository>(),
          gh<_i27.IAuthFacade>(),
        ));
    gh.factory<_i113.MyPostListBloc>(() => _i113.MyPostListBloc(
          gh<_i64.IPostRepository>(),
          gh<_i27.IAuthFacade>(),
        ));
    gh.factory<_i114.GetAllQuestionBloc>(
        () => _i114.GetAllQuestionBloc(gh<_i68.IQuestionRepository>()));
    gh.factory<_i115.UpdateNewEmailBloc>(
        () => _i115.UpdateNewEmailBloc(gh<_i79.IProfileInfoRepository>()));
    gh.factory<_i116.CommunityReplyCommentListBloc>(() =>
        _i116.CommunityReplyCommentListBloc(
            gh<_i72.ICommunityCommentRepository>()));
    gh.factory<_i117.CommunityCommentListBloc>(() =>
        _i117.CommunityCommentListBloc(gh<_i72.ICommunityCommentRepository>()));
    gh.factory<_i118.CommunityCommentLikesBloc>(() =>
        _i118.CommunityCommentLikesBloc(
            gh<_i72.ICommunityCommentRepository>()));
    gh.factory<_i119.AddReplyCommentBloc>(() => _i119.AddReplyCommentBloc(
          gh<_i65.ICommentRepository>(),
          gh<_i24.IAuthFacade>(),
          gh<_i9.ParentCommentIdBloc>(),
        ));
    gh.factory<_i120.CreateQuestionCommentBloc>(
        () => _i120.CreateQuestionCommentBloc(
              gh<_i51.IQuestionCommentRepository>(),
              gh<_i27.IAuthFacade>(),
            ));
    gh.factory<_i121.CreateQuestionReplyCommentBloc>(
        () => _i121.CreateQuestionReplyCommentBloc(
              gh<_i51.IQuestionCommentRepository>(),
              gh<_i27.IAuthFacade>(),
            ));
    gh.factory<_i122.CreateNotificationBloc>(() => _i122.CreateNotificationBloc(
          gh<_i53.INotification>(),
          gh<_i27.IAuthFacade>(),
        ));
    gh.factory<_i123.ReplyCommentListBloc>(
        () => _i123.ReplyCommentListBloc(gh<_i65.ICommentRepository>()));
    gh.factory<_i124.CommentLikesBloc>(
        () => _i124.CommentLikesBloc(gh<_i65.ICommentRepository>()));
    gh.factory<_i125.CommentListBloc>(
        () => _i125.CommentListBloc(gh<_i65.ICommentRepository>()));
    gh.factory<_i126.CommunityAddReplyCommentBloc>(
        () => _i126.CommunityAddReplyCommentBloc(
              gh<_i72.ICommunityCommentRepository>(),
              gh<_i27.IAuthFacade>(),
              gh<_i9.ParentCommentIdBloc>(),
            ));
    gh.factory<_i127.CommunityListBloc>(
        () => _i127.CommunityListBloc(gh<_i75.ICommunityRepository>()));
    gh.factory<_i128.PostListBloc>(() => _i128.PostListBloc(
          gh<_i64.IPostRepository>(),
          gh<_i113.MyPostListBloc>(),
        ));
    gh.factory<_i129.SendMessageBloc>(() => _i129.SendMessageBloc(
          gh<_i40.IChatRepository>(),
          gh<_i99.GetMessagesBloc>(),
          gh<_i27.IAuthFacade>(),
        ));
    gh.factory<_i130.CreateChatroomBloc>(() => _i130.CreateChatroomBloc(
          gh<_i40.IChatRepository>(),
          gh<_i99.GetMessagesBloc>(),
          gh<_i27.IAuthFacade>(),
        ));
    gh.factory<_i131.CommunityCommentCreateBloc>(
        () => _i131.CommunityCommentCreateBloc(
              gh<_i72.ICommunityCommentRepository>(),
              gh<_i27.IAuthFacade>(),
              gh<_i117.CommunityCommentListBloc>(),
            ));
    return this;
  }
}

class _$FirebaseModule extends _i132.FirebaseModule {}
