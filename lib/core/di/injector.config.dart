// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart' as _i6;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:w_sharme_beauty/features/adverts/data/firebase_advert_repository.dart'
    as _i41;
import 'package:w_sharme_beauty/features/adverts/domain/i_advert_repository.dart'
    as _i40;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/add_service/add_service_cubit.dart'
    as _i16;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts/adverts_cubit.dart'
    as _i105;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts_filter/adverts_filter_cubit.dart'
    as _i25;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/create_advert/create_advert_cubit.dart'
    as _i97;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/create_reply/create_reply_cubit.dart'
    as _i93;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/create_review/create_review_cubit.dart'
    as _i91;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/current_location/current_location_bloc.dart'
    as _i15;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/delete_advert/delete_advert_cubit.dart'
    as _i95;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/edit_advert/edit_advert_cubit.dart'
    as _i90;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/edit_service/edit_service_cubit.dart'
    as _i13;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/my_adverts/my_adverts_cubit.dart'
    as _i50;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/replies/replies_cubit.dart'
    as _i92;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/reviews/reviews_cubit.dart'
    as _i96;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/search_adverts/search_adverts_cubit.dart'
    as _i94;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/search_result/search_result_cubit.dart'
    as _i14;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/select_categories/select_categories_cubit.dart'
    as _i17;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/select_schedule/select_schedule_cubit.dart'
    as _i18;
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/select_services/select_services_cubit.dart'
    as _i12;
import 'package:w_sharme_beauty/features/auth/data/firebase_auth_facade.dart'
    as _i27;
import 'package:w_sharme_beauty/features/auth/data/firebase_notifcication_facade.dart'
    as _i56;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart'
    as _i29;
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_notification.dart'
    as _i55;
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart'
    as _i26;
import 'package:w_sharme_beauty/features/auth/domain/usecases/login_with_email.dart'
    as _i81;
import 'package:w_sharme_beauty/features/auth/domain/usecases/logout.dart'
    as _i28;
import 'package:w_sharme_beauty/features/auth/domain/usecases/register_with_email.dart'
    as _i80;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart'
    as _i57;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/create_notification_bloc/create_notification_bloc.dart'
    as _i126;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_notification_bloc/get_all_notification_bloc.dart'
    as _i106;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart'
    as _i33;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/subscribe_bloc/subscribe_bloc.dart'
    as _i35;
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart'
    as _i34;
import 'package:w_sharme_beauty/features/category/data/firebase_category_facade.dart'
    as _i31;
import 'package:w_sharme_beauty/features/category/domain/repositories/i_category_repository.dart'
    as _i30;
import 'package:w_sharme_beauty/features/category/presentation/bloc/category_bloc/category_bloc.dart'
    as _i32;
import 'package:w_sharme_beauty/features/chat/data/firebase_chat_facade.dart'
    as _i43;
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart'
    as _i42;
import 'package:w_sharme_beauty/features/chat/domain/use_cases/get_all_chats_use_cases.dart'
    as _i101;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart'
    as _i133;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart'
    as _i103;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart'
    as _i102;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart'
    as _i104;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart'
    as _i134;
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_post_bloc/send_post_bloc.dart'
    as _i47;
import 'package:w_sharme_beauty/features/chat_group/data/firebase_chat_group_facade.dart'
    as _i39;
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart'
    as _i38;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/added_chat_users_group_bloc/added_chat_users_group_bloc.dart'
    as _i19;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart'
    as _i22;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/create_chat_group_bloc/create_chat_group_bloc.dart'
    as _i61;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/filter_users_invite/filter_users_invite_bloc.dart'
    as _i21;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_admins_sorted_bloc/get_admins_sorted_bloc.dart'
    as _i20;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_admins_chat_group_bloc/get_all_admins_chat_group_bloc.dart'
    as _i46;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart'
    as _i58;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart'
    as _i64;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart'
    as _i45;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_people_chat_bloc/invite_people_chat_bloc.dart'
    as _i23;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/invite_users_chat_group_bloc/invite_users_chat_group_bloc.dart'
    as _i62;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart'
    as _i59;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart'
    as _i44;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_chat_group_bloc/update_chat_group_bloc.dart'
    as _i60;
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_manager_chat_group_bloc/update_manager_chat_group_bloc.dart'
    as _i63;
import 'package:w_sharme_beauty/features/comment/data/firebase_comment_facade.dart'
    as _i68;
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart'
    as _i67;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart'
    as _i123;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart'
    as _i77;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart'
    as _i128;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart'
    as _i129;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart'
    as _i11;
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart'
    as _i127;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_comment_facade.dart'
    as _i76;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_post_repository.dart'
    as _i52;
import 'package:w_sharme_beauty/features/communities/data/firebase_community_repository.dart'
    as _i79;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart'
    as _i75;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart'
    as _i51;
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart'
    as _i78;
import 'package:w_sharme_beauty/features/communities/domain/repositories/repositories.dart'
    as _i111;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart'
    as _i69;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_add_reply_comment_bloc/community_add_reply_comment_bloc.dart'
    as _i130;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_category_bloc/community_category_bloc.dart'
    as _i8;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_create_bloc/community_comment_create_bloc.dart'
    as _i135;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_likes_bloc/community_comment_likes_bloc.dart'
    as _i122;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_list_bloc/community_comment_list_bloc.dart'
    as _i121;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart'
    as _i115;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart'
    as _i74;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart'
    as _i84;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart'
    as _i131;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_parent_comment_id_bloc/community_parent_commet_id_bloc.dart'
    as _i10;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_detail_bloc/community_post_detail_bloc.dart'
    as _i110;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart'
    as _i87;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart'
    as _i107;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_reply_comment_lidt_bloc/community_reply_comment_list_bloc.dart'
    as _i120;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/like_community_post_bloc/like_community_post_bloc.dart'
    as _i9;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart'
    as _i112;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/subscribe_community_bloc/subscribe_community_bloc.dart'
    as _i86;
import 'package:w_sharme_beauty/features/communities/presentation/bloc/update_community_bloc/update_community_bloc.dart'
    as _i85;
import 'package:w_sharme_beauty/features/monitoring/dynamic_links_service.dart'
    as _i70;
import 'package:w_sharme_beauty/features/post/data/firebase_post_repository.dart'
    as _i49;
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart'
    as _i48;
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart'
    as _i66;
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart'
    as _i117;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart'
    as _i73;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart'
    as _i116;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart'
    as _i109;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart'
    as _i132;
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart'
    as _i114;
import 'package:w_sharme_beauty/features/post/presentation/bloc/repost_post_my_screen_bloc/repost_post_my_screen_bloc.dart'
    as _i108;
import 'package:w_sharme_beauty/features/post/presentation/bloc/repost_users_bloc/repost_users_bloc.dart'
    as _i7;
import 'package:w_sharme_beauty/features/post/presentation/bloc/subscribe_post/subscibe_post_bloc.dart'
    as _i65;
import 'package:w_sharme_beauty/features/profile/data/firebase_profile_facade.dart'
    as _i83;
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart'
    as _i82;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/category_list_bloc/category_list_bloc.dart'
    as _i24;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart'
    as _i36;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart'
    as _i88;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/update_new_email_bloc/update_new_email_bloc.dart'
    as _i119;
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart'
    as _i37;
import 'package:w_sharme_beauty/features/question/data/data/firebase_question_comment_facade.dart'
    as _i54;
import 'package:w_sharme_beauty/features/question/data/data/firebase_question_facade.dart'
    as _i72;
import 'package:w_sharme_beauty/features/question/domain/repositories/i_question_repository.dart'
    as _i71;
import 'package:w_sharme_beauty/features/question/domain/repositories/repositories.dart'
    as _i53;
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/add_question_bloc.dart'
    as _i89;
import 'package:w_sharme_beauty/features/question/presentation/bloc/create_question_comment_bloc/create_question_comment_bloc.dart'
    as _i124;
import 'package:w_sharme_beauty/features/question/presentation/bloc/create_question_reply_comment_bloc/create_question_reply_comment_bloc.dart'
    as _i125;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_bloc/get_all_question_bloc.dart'
    as _i118;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_comments_bloc/get_all_question_comments_bloc.dart'
    as _i98;
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_question_bloc/get_question_bloc.dart'
    as _i113;
import 'package:w_sharme_beauty/features/question/presentation/bloc/question_comment_like_bloc/question_comment_like_bloc.dart'
    as _i100;
import 'package:w_sharme_beauty/features/question/presentation/bloc/question_get_all_reply_comment_bloc/question_get_all_reply_comment_bloc.dart'
    as _i99;
import 'package:w_sharme_beauty/firebase_module.dart' as _i136;

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
    gh.factory<_i6.FirebaseDynamicLinks>(
        () => firebaseModule.firebaseDynamicLinks);
    gh.factory<_i7.RepostUsersBloc>(() => _i7.RepostUsersBloc());
    gh.factory<_i8.CommunityCategoryBloc>(() => _i8.CommunityCategoryBloc());
    gh.factory<_i9.LikeCommunityPostBloc>(() => _i9.LikeCommunityPostBloc());
    gh.factory<_i10.CommunityParentCommetIdBloc>(
        () => _i10.CommunityParentCommetIdBloc());
    gh.factory<_i11.ParentCommentIdBloc>(() => _i11.ParentCommentIdBloc());
    gh.factory<_i12.SelectServicesCubit>(() => _i12.SelectServicesCubit());
    gh.factory<_i13.EditServiceCubit>(() => _i13.EditServiceCubit());
    gh.factory<_i14.SearchResultCubit>(() => _i14.SearchResultCubit());
    gh.factory<_i15.CurrentLocationBloc>(() => _i15.CurrentLocationBloc());
    gh.factory<_i16.AddServiceCubit>(() => _i16.AddServiceCubit());
    gh.factory<_i17.SelectCategoriesCubit>(() => _i17.SelectCategoriesCubit());
    gh.factory<_i18.SelectScheduleCubit>(() => _i18.SelectScheduleCubit());
    gh.factory<_i19.AddedChatUsersGroupBloc>(
        () => _i19.AddedChatUsersGroupBloc());
    gh.factory<_i20.GetAdminsSortedBloc>(() => _i20.GetAdminsSortedBloc());
    gh.factory<_i21.FilterUsersInviteBloc>(() => _i21.FilterUsersInviteBloc());
    gh.factory<_i22.ChatGroupCheckManagerBloc>(
        () => _i22.ChatGroupCheckManagerBloc());
    gh.factory<_i23.InvitePeopleChatBloc>(() => _i23.InvitePeopleChatBloc());
    gh.factory<_i24.CategoryListBloc>(() => _i24.CategoryListBloc());
    gh.lazySingleton<_i25.AdvertsFilterCubit>(() => _i25.AdvertsFilterCubit());
    gh.lazySingleton<_i26.IAuthFacade>(() => _i27.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i28.LogoutUC>(
        () => _i28.LogoutUC(repository: gh<_i29.IAuthFacade>()));
    gh.lazySingleton<_i30.ICategoryRepository>(
        () => _i31.FirebaseCategoryFacade(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i32.CategoryBloc>(
        () => _i32.CategoryBloc(gh<_i30.ICategoryRepository>()));
    gh.factory<_i33.GetAllUsersBloc>(
        () => _i33.GetAllUsersBloc(gh<_i29.IAuthFacade>()));
    gh.factory<_i34.UpdateStatusUserBloc>(
        () => _i34.UpdateStatusUserBloc(gh<_i29.IAuthFacade>()));
    gh.factory<_i35.SubscribeBloc>(
        () => _i35.SubscribeBloc(gh<_i29.IAuthFacade>()));
    gh.factory<_i36.MyProfileInfoBloc>(
        () => _i36.MyProfileInfoBloc(gh<_i29.IAuthFacade>()));
    gh.factory<_i37.UserDetailBloc>(
        () => _i37.UserDetailBloc(gh<_i29.IAuthFacade>()));
    gh.lazySingleton<_i38.IChatGroupRepository>(
        () => _i39.FirebaseChatGroupFacade(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i40.IAdvertRepository>(
        () => _i41.FirebaseAdvertRepository(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i42.IChatRepository>(() => _i43.FirebaseChatFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i44.SendMessageGroupBloc>(() => _i44.SendMessageGroupBloc(
          gh<_i38.IChatGroupRepository>(),
          gh<_i29.IAuthFacade>(),
        ));
    gh.factory<_i45.GetGroupBloc>(() => _i45.GetGroupBloc(
          gh<_i38.IChatGroupRepository>(),
          gh<_i29.IAuthFacade>(),
        ));
    gh.factory<_i46.GetAllAdminsChatGroupBloc>(
        () => _i46.GetAllAdminsChatGroupBloc(
              gh<_i38.IChatGroupRepository>(),
              gh<_i29.IAuthFacade>(),
            ));
    gh.factory<_i47.SendPostBloc>(() => _i47.SendPostBloc(
          gh<_i42.IChatRepository>(),
          gh<_i29.IAuthFacade>(),
        ));
    gh.lazySingleton<_i48.IPostRepository>(() => _i49.FirestorePostRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i50.MyAdvertsCubit>(
        () => _i50.MyAdvertsCubit(gh<_i40.IAdvertRepository>()));
    gh.lazySingleton<_i51.ICommunityPostRepository>(
        () => _i52.FirestorePostRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i53.IQuestionCommentRepository>(
        () => _i54.FirebaseQuestionCommentFacade(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.FirebaseFirestore>(),
            ));
    gh.lazySingleton<_i55.INotification>(() => _i56.FirebaseNotification(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i57.AuthBloc>(() => _i57.AuthBloc(gh<_i29.IAuthFacade>()));
    gh.factory<_i58.GetAllChatGroupBloc>(
        () => _i58.GetAllChatGroupBloc(gh<_i38.IChatGroupRepository>()));
    gh.factory<_i59.RemoveAdminChatGroupBloc>(
        () => _i59.RemoveAdminChatGroupBloc(gh<_i38.IChatGroupRepository>()));
    gh.factory<_i60.UpdateChatGroupBloc>(
        () => _i60.UpdateChatGroupBloc(gh<_i38.IChatGroupRepository>()));
    gh.factory<_i61.CreateChatGroupBloc>(
        () => _i61.CreateChatGroupBloc(gh<_i38.IChatGroupRepository>()));
    gh.factory<_i62.InviteUsersChatGroupBloc>(
        () => _i62.InviteUsersChatGroupBloc(gh<_i38.IChatGroupRepository>()));
    gh.factory<_i63.UpdateManagerChatGroupBloc>(
        () => _i63.UpdateManagerChatGroupBloc(gh<_i38.IChatGroupRepository>()));
    gh.factory<_i64.GetAllGroupMessagesBloc>(
        () => _i64.GetAllGroupMessagesBloc(gh<_i38.IChatGroupRepository>()));
    gh.factory<_i65.SubscibePostBloc>(() => _i65.SubscibePostBloc(
          gh<_i66.IPostRepository>(),
          gh<_i35.SubscribeBloc>(),
        ));
    gh.lazySingleton<_i67.ICommentRepository>(() => _i68.FirebaseCommentFacade(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i69.CommunityLikeBloc>(
        () => _i69.CommunityLikeBloc(gh<_i51.ICommunityPostRepository>()));
    gh.lazySingleton<_i70.DynamicLinkService>(
        () => _i70.DynamicLinkService(gh<_i6.FirebaseDynamicLinks>()));
    gh.lazySingleton<_i71.IQuestionRepository>(
        () => _i72.FirebaseQuestionFacade(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i73.PostCreateBloc>(() => _i73.PostCreateBloc(
          gh<_i66.IPostRepository>(),
          gh<_i29.IAuthFacade>(),
        ));
    gh.factory<_i74.CommunityCreatePostBloc>(() => _i74.CommunityCreatePostBloc(
          gh<_i51.ICommunityPostRepository>(),
          gh<_i29.IAuthFacade>(),
        ));
    gh.lazySingleton<_i75.ICommunityCommentRepository>(
        () => _i76.FirebaseCommunityCommentFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
            ));
    gh.factory<_i77.CommentCreateBloc>(() => _i77.CommentCreateBloc(
          gh<_i67.ICommentRepository>(),
          gh<_i26.IAuthFacade>(),
        ));
    gh.lazySingleton<_i78.ICommunityRepository>(
        () => _i79.FirestoreCommunityRepository(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i80.RegisterWithEmailUC>(
        () => _i80.RegisterWithEmailUC(repository: gh<_i26.IAuthFacade>()));
    gh.factory<_i81.LoginWithEmailUC>(
        () => _i81.LoginWithEmailUC(repository: gh<_i26.IAuthFacade>()));
    gh.lazySingleton<_i82.IProfileInfoRepository>(
        () => _i83.FirebaseProfileFacade(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
              gh<_i5.FirebaseStorage>(),
            ));
    gh.factory<_i84.CommunityDetailBloc>(
        () => _i84.CommunityDetailBloc(gh<_i78.ICommunityRepository>()));
    gh.factory<_i85.UpdateCommunityBloc>(
        () => _i85.UpdateCommunityBloc(gh<_i78.ICommunityRepository>()));
    gh.factory<_i86.SubscribeCommunityBloc>(
        () => _i86.SubscribeCommunityBloc(gh<_i78.ICommunityRepository>()));
    gh.factory<_i87.CommunityPostListBloc>(
        () => _i87.CommunityPostListBloc(gh<_i51.ICommunityPostRepository>()));
    gh.factory<_i88.ProfileInfoUpdateBloc>(() => _i88.ProfileInfoUpdateBloc(
          gh<_i82.IProfileInfoRepository>(),
          gh<_i26.IAuthFacade>(),
        ));
    gh.factory<_i89.AddQuestionBloc>(() => _i89.AddQuestionBloc(
          gh<_i71.IQuestionRepository>(),
          gh<_i29.IAuthFacade>(),
        ));
    gh.factory<_i90.EditAdvertCubit>(
        () => _i90.EditAdvertCubit(gh<_i40.IAdvertRepository>()));
    gh.factory<_i91.CreateReviewCubit>(
        () => _i91.CreateReviewCubit(gh<_i40.IAdvertRepository>()));
    gh.factory<_i92.RepliesCubit>(
        () => _i92.RepliesCubit(gh<_i40.IAdvertRepository>()));
    gh.factory<_i93.CreateReplyCubit>(
        () => _i93.CreateReplyCubit(gh<_i40.IAdvertRepository>()));
    gh.factory<_i94.SearchAdvertsCubit>(
        () => _i94.SearchAdvertsCubit(gh<_i40.IAdvertRepository>()));
    gh.factory<_i95.DeleteAdvertCubit>(
        () => _i95.DeleteAdvertCubit(gh<_i40.IAdvertRepository>()));
    gh.factory<_i96.ReviewsCubit>(
        () => _i96.ReviewsCubit(gh<_i40.IAdvertRepository>()));
    gh.factory<_i97.CreateAdvertCubit>(
        () => _i97.CreateAdvertCubit(gh<_i40.IAdvertRepository>()));
    gh.factory<_i98.GetAllQuestionCommentsBloc>(() =>
        _i98.GetAllQuestionCommentsBloc(gh<_i53.IQuestionCommentRepository>()));
    gh.factory<_i99.QuestionGetAllReplyCommentBloc>(() =>
        _i99.QuestionGetAllReplyCommentBloc(
            gh<_i53.IQuestionCommentRepository>()));
    gh.factory<_i100.QuestionCommentLikeBloc>(() =>
        _i100.QuestionCommentLikeBloc(gh<_i53.IQuestionCommentRepository>()));
    gh.factory<_i101.GetAllChatsUseCase>(
        () => _i101.GetAllChatsUseCase(gh<_i42.IChatRepository>()));
    gh.factory<_i102.GetMessagesBloc>(
        () => _i102.GetMessagesBloc(gh<_i42.IChatRepository>()));
    gh.factory<_i103.GetAllChatsBloc>(
        () => _i103.GetAllChatsBloc(gh<_i42.IChatRepository>()));
    gh.factory<_i104.SeenMessageBloc>(
        () => _i104.SeenMessageBloc(gh<_i42.IChatRepository>()));
    gh.factory<_i105.AdvertsCubit>(() => _i105.AdvertsCubit(
          gh<_i40.IAdvertRepository>(),
          gh<_i25.AdvertsFilterCubit>(),
        ));
    gh.factory<_i106.GetAllNotificationBloc>(
        () => _i106.GetAllNotificationBloc(gh<_i55.INotification>()));
    gh.factory<_i107.CommunityProfileInfoBloc>(
        () => _i107.CommunityProfileInfoBloc(
              gh<_i29.IAuthFacade>(),
              gh<_i82.IProfileInfoRepository>(),
            ));
    gh.factory<_i108.RepostPostMyScreenBloc>(() => _i108.RepostPostMyScreenBloc(
          gh<_i66.IPostRepository>(),
          gh<_i26.IAuthFacade>(),
        ));
    gh.factory<_i109.PostLikeBloc>(() => _i109.PostLikeBloc(
          gh<_i66.IPostRepository>(),
          gh<_i26.IAuthFacade>(),
        ));
    gh.factory<_i110.CommunityPostDetailBloc>(() =>
        _i110.CommunityPostDetailBloc(gh<_i111.ICommunityPostRepository>()));
    gh.factory<_i112.MyCommunityListBloc>(() => _i112.MyCommunityListBloc(
          gh<_i78.ICommunityRepository>(),
          gh<_i29.IAuthFacade>(),
        ));
    gh.factory<_i113.GetQuestionBloc>(
        () => _i113.GetQuestionBloc(gh<_i53.IQuestionRepository>()));
    gh.factory<_i114.PostUserListBloc>(
        () => _i114.PostUserListBloc(gh<_i48.IPostRepository>()));
    gh.factory<_i115.CommunityCreateBloc>(() => _i115.CommunityCreateBloc(
          gh<_i78.ICommunityRepository>(),
          gh<_i29.IAuthFacade>(),
        ));
    gh.factory<_i116.PostDetailBloc>(() => _i116.PostDetailBloc(
          gh<_i66.IPostRepository>(),
          gh<_i29.IAuthFacade>(),
        ));
    gh.factory<_i117.MyPostListBloc>(() => _i117.MyPostListBloc(
          gh<_i66.IPostRepository>(),
          gh<_i29.IAuthFacade>(),
        ));
    gh.factory<_i118.GetAllQuestionBloc>(
        () => _i118.GetAllQuestionBloc(gh<_i71.IQuestionRepository>()));
    gh.factory<_i119.UpdateNewEmailBloc>(
        () => _i119.UpdateNewEmailBloc(gh<_i82.IProfileInfoRepository>()));
    gh.factory<_i120.CommunityReplyCommentListBloc>(() =>
        _i120.CommunityReplyCommentListBloc(
            gh<_i75.ICommunityCommentRepository>()));
    gh.factory<_i121.CommunityCommentListBloc>(() =>
        _i121.CommunityCommentListBloc(gh<_i75.ICommunityCommentRepository>()));
    gh.factory<_i122.CommunityCommentLikesBloc>(() =>
        _i122.CommunityCommentLikesBloc(
            gh<_i75.ICommunityCommentRepository>()));
    gh.factory<_i123.AddReplyCommentBloc>(() => _i123.AddReplyCommentBloc(
          gh<_i67.ICommentRepository>(),
          gh<_i26.IAuthFacade>(),
          gh<_i11.ParentCommentIdBloc>(),
        ));
    gh.factory<_i124.CreateQuestionCommentBloc>(
        () => _i124.CreateQuestionCommentBloc(
              gh<_i53.IQuestionCommentRepository>(),
              gh<_i29.IAuthFacade>(),
            ));
    gh.factory<_i125.CreateQuestionReplyCommentBloc>(
        () => _i125.CreateQuestionReplyCommentBloc(
              gh<_i53.IQuestionCommentRepository>(),
              gh<_i29.IAuthFacade>(),
            ));
    gh.factory<_i126.CreateNotificationBloc>(() => _i126.CreateNotificationBloc(
          gh<_i55.INotification>(),
          gh<_i29.IAuthFacade>(),
        ));
    gh.factory<_i127.ReplyCommentListBloc>(
        () => _i127.ReplyCommentListBloc(gh<_i67.ICommentRepository>()));
    gh.factory<_i128.CommentLikesBloc>(
        () => _i128.CommentLikesBloc(gh<_i67.ICommentRepository>()));
    gh.factory<_i129.CommentListBloc>(
        () => _i129.CommentListBloc(gh<_i67.ICommentRepository>()));
    gh.factory<_i130.CommunityAddReplyCommentBloc>(
        () => _i130.CommunityAddReplyCommentBloc(
              gh<_i75.ICommunityCommentRepository>(),
              gh<_i29.IAuthFacade>(),
              gh<_i11.ParentCommentIdBloc>(),
            ));
    gh.factory<_i131.CommunityListBloc>(
        () => _i131.CommunityListBloc(gh<_i78.ICommunityRepository>()));
    gh.factory<_i132.PostListBloc>(() => _i132.PostListBloc(
          gh<_i66.IPostRepository>(),
          gh<_i117.MyPostListBloc>(),
        ));
    gh.factory<_i133.CreateChatroomBloc>(() => _i133.CreateChatroomBloc(
          gh<_i42.IChatRepository>(),
          gh<_i102.GetMessagesBloc>(),
          gh<_i29.IAuthFacade>(),
        ));
    gh.factory<_i134.SendMessageBloc>(() => _i134.SendMessageBloc(
          gh<_i42.IChatRepository>(),
          gh<_i102.GetMessagesBloc>(),
          gh<_i29.IAuthFacade>(),
        ));
    gh.factory<_i135.CommunityCommentCreateBloc>(
        () => _i135.CommunityCommentCreateBloc(
              gh<_i75.ICommunityCommentRepository>(),
              gh<_i29.IAuthFacade>(),
              gh<_i121.CommunityCommentListBloc>(),
            ));
    return this;
  }
}

class _$FirebaseModule extends _i136.FirebaseModule {}
