// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Post post, List<Uint8List> imageFiles) createPost,
    required TResult Function() getPosts,
    required TResult Function() getMePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Post post, List<Uint8List> imageFiles)? createPost,
    TResult? Function()? getPosts,
    TResult? Function()? getMePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Post post, List<Uint8List> imageFiles)? createPost,
    TResult Function()? getPosts,
    TResult Function()? getMePosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreatePost value) createPost,
    required TResult Function(_GetPost value) getPosts,
    required TResult Function(_GetMePost value) getMePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreatePost value)? createPost,
    TResult? Function(_GetPost value)? getPosts,
    TResult? Function(_GetMePost value)? getMePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_GetPost value)? getPosts,
    TResult Function(_GetMePost value)? getMePosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEventCopyWith<$Res> {
  factory $PostEventCopyWith(PostEvent value, $Res Function(PostEvent) then) =
      _$PostEventCopyWithImpl<$Res, PostEvent>;
}

/// @nodoc
class _$PostEventCopyWithImpl<$Res, $Val extends PostEvent>
    implements $PostEventCopyWith<$Res> {
  _$PostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'PostEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Post post, List<Uint8List> imageFiles) createPost,
    required TResult Function() getPosts,
    required TResult Function() getMePosts,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Post post, List<Uint8List> imageFiles)? createPost,
    TResult? Function()? getPosts,
    TResult? Function()? getMePosts,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Post post, List<Uint8List> imageFiles)? createPost,
    TResult Function()? getPosts,
    TResult Function()? getMePosts,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreatePost value) createPost,
    required TResult Function(_GetPost value) getPosts,
    required TResult Function(_GetMePost value) getMePosts,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreatePost value)? createPost,
    TResult? Function(_GetPost value)? getPosts,
    TResult? Function(_GetMePost value)? getMePosts,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_GetPost value)? getPosts,
    TResult Function(_GetMePost value)? getMePosts,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PostEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CreatePostImplCopyWith<$Res> {
  factory _$$CreatePostImplCopyWith(
          _$CreatePostImpl value, $Res Function(_$CreatePostImpl) then) =
      __$$CreatePostImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Post post, List<Uint8List> imageFiles});

  $PostCopyWith<$Res> get post;
}

/// @nodoc
class __$$CreatePostImplCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res, _$CreatePostImpl>
    implements _$$CreatePostImplCopyWith<$Res> {
  __$$CreatePostImplCopyWithImpl(
      _$CreatePostImpl _value, $Res Function(_$CreatePostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
    Object? imageFiles = null,
  }) {
    return _then(_$CreatePostImpl(
      null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
      null == imageFiles
          ? _value._imageFiles
          : imageFiles // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res> get post {
    return $PostCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value));
    });
  }
}

/// @nodoc

class _$CreatePostImpl implements _CreatePost {
  const _$CreatePostImpl(this.post, final List<Uint8List> imageFiles)
      : _imageFiles = imageFiles;

  @override
  final Post post;
  final List<Uint8List> _imageFiles;
  @override
  List<Uint8List> get imageFiles {
    if (_imageFiles is EqualUnmodifiableListView) return _imageFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageFiles);
  }

  @override
  String toString() {
    return 'PostEvent.createPost(post: $post, imageFiles: $imageFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostImpl &&
            (identical(other.post, post) || other.post == post) &&
            const DeepCollectionEquality()
                .equals(other._imageFiles, _imageFiles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, post, const DeepCollectionEquality().hash(_imageFiles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostImplCopyWith<_$CreatePostImpl> get copyWith =>
      __$$CreatePostImplCopyWithImpl<_$CreatePostImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Post post, List<Uint8List> imageFiles) createPost,
    required TResult Function() getPosts,
    required TResult Function() getMePosts,
  }) {
    return createPost(post, imageFiles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Post post, List<Uint8List> imageFiles)? createPost,
    TResult? Function()? getPosts,
    TResult? Function()? getMePosts,
  }) {
    return createPost?.call(post, imageFiles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Post post, List<Uint8List> imageFiles)? createPost,
    TResult Function()? getPosts,
    TResult Function()? getMePosts,
    required TResult orElse(),
  }) {
    if (createPost != null) {
      return createPost(post, imageFiles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreatePost value) createPost,
    required TResult Function(_GetPost value) getPosts,
    required TResult Function(_GetMePost value) getMePosts,
  }) {
    return createPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreatePost value)? createPost,
    TResult? Function(_GetPost value)? getPosts,
    TResult? Function(_GetMePost value)? getMePosts,
  }) {
    return createPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_GetPost value)? getPosts,
    TResult Function(_GetMePost value)? getMePosts,
    required TResult orElse(),
  }) {
    if (createPost != null) {
      return createPost(this);
    }
    return orElse();
  }
}

abstract class _CreatePost implements PostEvent {
  const factory _CreatePost(final Post post, final List<Uint8List> imageFiles) =
      _$CreatePostImpl;

  Post get post;
  List<Uint8List> get imageFiles;
  @JsonKey(ignore: true)
  _$$CreatePostImplCopyWith<_$CreatePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPostImplCopyWith<$Res> {
  factory _$$GetPostImplCopyWith(
          _$GetPostImpl value, $Res Function(_$GetPostImpl) then) =
      __$$GetPostImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPostImplCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res, _$GetPostImpl>
    implements _$$GetPostImplCopyWith<$Res> {
  __$$GetPostImplCopyWithImpl(
      _$GetPostImpl _value, $Res Function(_$GetPostImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetPostImpl implements _GetPost {
  const _$GetPostImpl();

  @override
  String toString() {
    return 'PostEvent.getPosts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPostImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Post post, List<Uint8List> imageFiles) createPost,
    required TResult Function() getPosts,
    required TResult Function() getMePosts,
  }) {
    return getPosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Post post, List<Uint8List> imageFiles)? createPost,
    TResult? Function()? getPosts,
    TResult? Function()? getMePosts,
  }) {
    return getPosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Post post, List<Uint8List> imageFiles)? createPost,
    TResult Function()? getPosts,
    TResult Function()? getMePosts,
    required TResult orElse(),
  }) {
    if (getPosts != null) {
      return getPosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreatePost value) createPost,
    required TResult Function(_GetPost value) getPosts,
    required TResult Function(_GetMePost value) getMePosts,
  }) {
    return getPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreatePost value)? createPost,
    TResult? Function(_GetPost value)? getPosts,
    TResult? Function(_GetMePost value)? getMePosts,
  }) {
    return getPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_GetPost value)? getPosts,
    TResult Function(_GetMePost value)? getMePosts,
    required TResult orElse(),
  }) {
    if (getPosts != null) {
      return getPosts(this);
    }
    return orElse();
  }
}

abstract class _GetPost implements PostEvent {
  const factory _GetPost() = _$GetPostImpl;
}

/// @nodoc
abstract class _$$GetMePostImplCopyWith<$Res> {
  factory _$$GetMePostImplCopyWith(
          _$GetMePostImpl value, $Res Function(_$GetMePostImpl) then) =
      __$$GetMePostImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMePostImplCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res, _$GetMePostImpl>
    implements _$$GetMePostImplCopyWith<$Res> {
  __$$GetMePostImplCopyWithImpl(
      _$GetMePostImpl _value, $Res Function(_$GetMePostImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetMePostImpl implements _GetMePost {
  const _$GetMePostImpl();

  @override
  String toString() {
    return 'PostEvent.getMePosts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetMePostImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Post post, List<Uint8List> imageFiles) createPost,
    required TResult Function() getPosts,
    required TResult Function() getMePosts,
  }) {
    return getMePosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Post post, List<Uint8List> imageFiles)? createPost,
    TResult? Function()? getPosts,
    TResult? Function()? getMePosts,
  }) {
    return getMePosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Post post, List<Uint8List> imageFiles)? createPost,
    TResult Function()? getPosts,
    TResult Function()? getMePosts,
    required TResult orElse(),
  }) {
    if (getMePosts != null) {
      return getMePosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreatePost value) createPost,
    required TResult Function(_GetPost value) getPosts,
    required TResult Function(_GetMePost value) getMePosts,
  }) {
    return getMePosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreatePost value)? createPost,
    TResult? Function(_GetPost value)? getPosts,
    TResult? Function(_GetMePost value)? getMePosts,
  }) {
    return getMePosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_GetPost value)? getPosts,
    TResult Function(_GetMePost value)? getMePosts,
    required TResult orElse(),
  }) {
    if (getMePosts != null) {
      return getMePosts(this);
    }
    return orElse();
  }
}

abstract class _GetMePost implements PostEvent {
  const factory _GetMePost() = _$GetMePostImpl;
}

/// @nodoc
mixin _$PostState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(List<Post> posts) getPosts,
    required TResult Function(List<Post> posts) getMePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(List<Post> posts)? getPosts,
    TResult? Function(List<Post> posts)? getMePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(List<Post> posts)? getPosts,
    TResult Function(List<Post> posts)? getMePosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetPost value) getPosts,
    required TResult Function(_SuccessGetMePost value) getMePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetPost value)? getPosts,
    TResult? Function(_SuccessGetMePost value)? getMePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetPost value)? getPosts,
    TResult Function(_SuccessGetMePost value)? getMePosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res, PostState>;
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res, $Val extends PostState>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PostState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(List<Post> posts) getPosts,
    required TResult Function(List<Post> posts) getMePosts,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(List<Post> posts)? getPosts,
    TResult? Function(List<Post> posts)? getMePosts,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(List<Post> posts)? getPosts,
    TResult Function(List<Post> posts)? getMePosts,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetPost value) getPosts,
    required TResult Function(_SuccessGetMePost value) getMePosts,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetPost value)? getPosts,
    TResult? Function(_SuccessGetMePost value)? getMePosts,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetPost value)? getPosts,
    TResult Function(_SuccessGetMePost value)? getMePosts,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PostState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PostState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(List<Post> posts) getPosts,
    required TResult Function(List<Post> posts) getMePosts,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(List<Post> posts)? getPosts,
    TResult? Function(List<Post> posts)? getMePosts,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(List<Post> posts)? getPosts,
    TResult Function(List<Post> posts)? getMePosts,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetPost value) getPosts,
    required TResult Function(_SuccessGetMePost value) getMePosts,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetPost value)? getPosts,
    TResult? Function(_SuccessGetMePost value)? getMePosts,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetPost value)? getPosts,
    TResult Function(_SuccessGetMePost value)? getMePosts,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PostState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'PostState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(List<Post> posts) getPosts,
    required TResult Function(List<Post> posts) getMePosts,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(List<Post> posts)? getPosts,
    TResult? Function(List<Post> posts)? getMePosts,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(List<Post> posts)? getPosts,
    TResult Function(List<Post> posts)? getMePosts,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetPost value) getPosts,
    required TResult Function(_SuccessGetMePost value) getMePosts,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetPost value)? getPosts,
    TResult? Function(_SuccessGetMePost value)? getMePosts,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetPost value)? getPosts,
    TResult Function(_SuccessGetMePost value)? getMePosts,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements PostState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'PostState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(List<Post> posts) getPosts,
    required TResult Function(List<Post> posts) getMePosts,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(List<Post> posts)? getPosts,
    TResult? Function(List<Post> posts)? getMePosts,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(List<Post> posts)? getPosts,
    TResult Function(List<Post> posts)? getMePosts,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetPost value) getPosts,
    required TResult Function(_SuccessGetMePost value) getMePosts,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetPost value)? getPosts,
    TResult? Function(_SuccessGetMePost value)? getMePosts,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetPost value)? getPosts,
    TResult Function(_SuccessGetMePost value)? getMePosts,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PostState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessGetPostImplCopyWith<$Res> {
  factory _$$SuccessGetPostImplCopyWith(_$SuccessGetPostImpl value,
          $Res Function(_$SuccessGetPostImpl) then) =
      __$$SuccessGetPostImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Post> posts});
}

/// @nodoc
class __$$SuccessGetPostImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$SuccessGetPostImpl>
    implements _$$SuccessGetPostImplCopyWith<$Res> {
  __$$SuccessGetPostImplCopyWithImpl(
      _$SuccessGetPostImpl _value, $Res Function(_$SuccessGetPostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
  }) {
    return _then(_$SuccessGetPostImpl(
      null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$SuccessGetPostImpl implements _SuccessGetPost {
  const _$SuccessGetPostImpl(final List<Post> posts) : _posts = posts;

  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'PostState.getPosts(posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessGetPostImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessGetPostImplCopyWith<_$SuccessGetPostImpl> get copyWith =>
      __$$SuccessGetPostImplCopyWithImpl<_$SuccessGetPostImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(List<Post> posts) getPosts,
    required TResult Function(List<Post> posts) getMePosts,
  }) {
    return getPosts(posts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(List<Post> posts)? getPosts,
    TResult? Function(List<Post> posts)? getMePosts,
  }) {
    return getPosts?.call(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(List<Post> posts)? getPosts,
    TResult Function(List<Post> posts)? getMePosts,
    required TResult orElse(),
  }) {
    if (getPosts != null) {
      return getPosts(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetPost value) getPosts,
    required TResult Function(_SuccessGetMePost value) getMePosts,
  }) {
    return getPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetPost value)? getPosts,
    TResult? Function(_SuccessGetMePost value)? getMePosts,
  }) {
    return getPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetPost value)? getPosts,
    TResult Function(_SuccessGetMePost value)? getMePosts,
    required TResult orElse(),
  }) {
    if (getPosts != null) {
      return getPosts(this);
    }
    return orElse();
  }
}

abstract class _SuccessGetPost implements PostState {
  const factory _SuccessGetPost(final List<Post> posts) = _$SuccessGetPostImpl;

  List<Post> get posts;
  @JsonKey(ignore: true)
  _$$SuccessGetPostImplCopyWith<_$SuccessGetPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessGetMePostImplCopyWith<$Res> {
  factory _$$SuccessGetMePostImplCopyWith(_$SuccessGetMePostImpl value,
          $Res Function(_$SuccessGetMePostImpl) then) =
      __$$SuccessGetMePostImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Post> posts});
}

/// @nodoc
class __$$SuccessGetMePostImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$SuccessGetMePostImpl>
    implements _$$SuccessGetMePostImplCopyWith<$Res> {
  __$$SuccessGetMePostImplCopyWithImpl(_$SuccessGetMePostImpl _value,
      $Res Function(_$SuccessGetMePostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
  }) {
    return _then(_$SuccessGetMePostImpl(
      null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$SuccessGetMePostImpl implements _SuccessGetMePost {
  const _$SuccessGetMePostImpl(final List<Post> posts) : _posts = posts;

  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'PostState.getMePosts(posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessGetMePostImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessGetMePostImplCopyWith<_$SuccessGetMePostImpl> get copyWith =>
      __$$SuccessGetMePostImplCopyWithImpl<_$SuccessGetMePostImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(List<Post> posts) getPosts,
    required TResult Function(List<Post> posts) getMePosts,
  }) {
    return getMePosts(posts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(List<Post> posts)? getPosts,
    TResult? Function(List<Post> posts)? getMePosts,
  }) {
    return getMePosts?.call(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(List<Post> posts)? getPosts,
    TResult Function(List<Post> posts)? getMePosts,
    required TResult orElse(),
  }) {
    if (getMePosts != null) {
      return getMePosts(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetPost value) getPosts,
    required TResult Function(_SuccessGetMePost value) getMePosts,
  }) {
    return getMePosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetPost value)? getPosts,
    TResult? Function(_SuccessGetMePost value)? getMePosts,
  }) {
    return getMePosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetPost value)? getPosts,
    TResult Function(_SuccessGetMePost value)? getMePosts,
    required TResult orElse(),
  }) {
    if (getMePosts != null) {
      return getMePosts(this);
    }
    return orElse();
  }
}

abstract class _SuccessGetMePost implements PostState {
  const factory _SuccessGetMePost(final List<Post> posts) =
      _$SuccessGetMePostImpl;

  List<Post> get posts;
  @JsonKey(ignore: true)
  _$$SuccessGetMePostImplCopyWith<_$SuccessGetMePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
