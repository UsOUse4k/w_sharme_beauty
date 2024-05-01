import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart';

class BlocProviders extends StatelessWidget {
  const BlocProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider<PostListBloc>(
          create: (context) => getIt<PostListBloc>(),
        ),
        BlocProvider<MyPostListBloc>(
          create: (context) => getIt<MyPostListBloc>(),
        ),
        BlocProvider<PostCreateBloc>(
          create: (context) => getIt<PostCreateBloc>(),
        ),
      ],
      child: child,
    );
  }
}
