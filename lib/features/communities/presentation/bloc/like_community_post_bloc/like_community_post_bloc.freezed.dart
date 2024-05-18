// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_community_post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LikeCommunityPostEvent {
  Post get post => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Post post) toggleLikes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Post post)? toggleLikes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Post post)? toggleLikes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleLikes value) toggleLikes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleLikes value)? toggleLikes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleLikes value)? toggleLikes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikeCommunityPostEventCopyWith<LikeCommunityPostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeCommunityPostEventCopyWith<$Res> {
  factory $LikeCommunityPostEventCopyWith(LikeCommunityPostEvent value,
          $Res Function(LikeCommunityPostEvent) then) =
      _$LikeCommunityPostEventCopyWithImpl<$Res, LikeCommunityPostEvent>;
  @useResult
  $Res call({Post post});

  $PostCopyWith<$Res> get post;
}

/// @nodoc
class _$LikeCommunityPostEventCopyWithImpl<$Res,
        $Val extends LikeCommunityPostEvent>
    implements $LikeCommunityPostEventCopyWith<$Res> {
  _$LikeCommunityPostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
  }) {
    return _then(_value.copyWith(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res> get post {
    return $PostCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ToggleLikesImplCopyWith<$Res>
    implements $LikeCommunityPostEventCopyWith<$Res> {
  factory _$$ToggleLikesImplCopyWith(
          _$ToggleLikesImpl value, $Res Function(_$ToggleLikesImpl) then) =
      __$$ToggleLikesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Post post});

  @override
  $PostCopyWith<$Res> get post;
}

/// @nodoc
class __$$ToggleLikesImplCopyWithImpl<$Res>
    extends _$LikeCommunityPostEventCopyWithImpl<$Res, _$ToggleLikesImpl>
    implements _$$ToggleLikesImplCopyWith<$Res> {
  __$$ToggleLikesImplCopyWithImpl(
      _$ToggleLikesImpl _value, $Res Function(_$ToggleLikesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
  }) {
    return _then(_$ToggleLikesImpl(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
    ));
  }
}

/// @nodoc

class _$ToggleLikesImpl implements _ToggleLikes {
  const _$ToggleLikesImpl({required this.post});

  @override
  final Post post;

  @override
  String toString() {
    return 'LikeCommunityPostEvent.toggleLikes(post: $post)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleLikesImpl &&
            (identical(other.post, post) || other.post == post));
  }

  @override
  int get hashCode => Object.hash(runtimeType, post);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleLikesImplCopyWith<_$ToggleLikesImpl> get copyWith =>
      __$$ToggleLikesImplCopyWithImpl<_$ToggleLikesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Post post) toggleLikes,
  }) {
    return toggleLikes(post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Post post)? toggleLikes,
  }) {
    return toggleLikes?.call(post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Post post)? toggleLikes,
    required TResult orElse(),
  }) {
    if (toggleLikes != null) {
      return toggleLikes(post);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleLikes value) toggleLikes,
  }) {
    return toggleLikes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleLikes value)? toggleLikes,
  }) {
    return toggleLikes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleLikes value)? toggleLikes,
    required TResult orElse(),
  }) {
    if (toggleLikes != null) {
      return toggleLikes(this);
    }
    return orElse();
  }
}

abstract class _ToggleLikes implements LikeCommunityPostEvent {
  const factory _ToggleLikes({required final Post post}) = _$ToggleLikesImpl;

  @override
  Post get post;
  @override
  @JsonKey(ignore: true)
  _$$ToggleLikesImplCopyWith<_$ToggleLikesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LikeCommunityPostState {
  List<Post> get selectedPosts => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Post> selectedPosts) selectedPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Post> selectedPosts)? selectedPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Post> selectedPosts)? selectedPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedPosts value) selectedPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedPosts value)? selectedPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedPosts value)? selectedPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikeCommunityPostStateCopyWith<LikeCommunityPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeCommunityPostStateCopyWith<$Res> {
  factory $LikeCommunityPostStateCopyWith(LikeCommunityPostState value,
          $Res Function(LikeCommunityPostState) then) =
      _$LikeCommunityPostStateCopyWithImpl<$Res, LikeCommunityPostState>;
  @useResult
  $Res call({List<Post> selectedPosts});
}

/// @nodoc
class _$LikeCommunityPostStateCopyWithImpl<$Res,
        $Val extends LikeCommunityPostState>
    implements $LikeCommunityPostStateCopyWith<$Res> {
  _$LikeCommunityPostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedPosts = null,
  }) {
    return _then(_value.copyWith(
      selectedPosts: null == selectedPosts
          ? _value.selectedPosts
          : selectedPosts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedPostsImplCopyWith<$Res>
    implements $LikeCommunityPostStateCopyWith<$Res> {
  factory _$$SelectedPostsImplCopyWith(
          _$SelectedPostsImpl value, $Res Function(_$SelectedPostsImpl) then) =
      __$$SelectedPostsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Post> selectedPosts});
}

/// @nodoc
class __$$SelectedPostsImplCopyWithImpl<$Res>
    extends _$LikeCommunityPostStateCopyWithImpl<$Res, _$SelectedPostsImpl>
    implements _$$SelectedPostsImplCopyWith<$Res> {
  __$$SelectedPostsImplCopyWithImpl(
      _$SelectedPostsImpl _value, $Res Function(_$SelectedPostsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedPosts = null,
  }) {
    return _then(_$SelectedPostsImpl(
      selectedPosts: null == selectedPosts
          ? _value._selectedPosts
          : selectedPosts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$SelectedPostsImpl implements _SelectedPosts {
  const _$SelectedPostsImpl({final List<Post> selectedPosts = const []})
      : _selectedPosts = selectedPosts;

  final List<Post> _selectedPosts;
  @override
  @JsonKey()
  List<Post> get selectedPosts {
    if (_selectedPosts is EqualUnmodifiableListView) return _selectedPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedPosts);
  }

  @override
  String toString() {
    return 'LikeCommunityPostState.selectedPosts(selectedPosts: $selectedPosts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedPostsImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedPosts, _selectedPosts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedPosts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedPostsImplCopyWith<_$SelectedPostsImpl> get copyWith =>
      __$$SelectedPostsImplCopyWithImpl<_$SelectedPostsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Post> selectedPosts) selectedPosts,
  }) {
    return selectedPosts(this.selectedPosts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Post> selectedPosts)? selectedPosts,
  }) {
    return selectedPosts?.call(this.selectedPosts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Post> selectedPosts)? selectedPosts,
    required TResult orElse(),
  }) {
    if (selectedPosts != null) {
      return selectedPosts(this.selectedPosts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedPosts value) selectedPosts,
  }) {
    return selectedPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedPosts value)? selectedPosts,
  }) {
    return selectedPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedPosts value)? selectedPosts,
    required TResult orElse(),
  }) {
    if (selectedPosts != null) {
      return selectedPosts(this);
    }
    return orElse();
  }
}

abstract class _SelectedPosts implements LikeCommunityPostState {
  const factory _SelectedPosts({final List<Post> selectedPosts}) =
      _$SelectedPostsImpl;

  @override
  List<Post> get selectedPosts;
  @override
  @JsonKey(ignore: true)
  _$$SelectedPostsImplCopyWith<_$SelectedPostsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
