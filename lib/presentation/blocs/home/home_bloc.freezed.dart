// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(List<Category> categories, List<Game> games) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(List<Category> categories, List<Game> games)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(List<Category> categories, List<Game> games)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchData value) fetch,
    required TResult Function(SaveData value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchData value)? fetch,
    TResult? Function(SaveData value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchData value)? fetch,
    TResult Function(SaveData value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchDataImplCopyWith<$Res> {
  factory _$$FetchDataImplCopyWith(
          _$FetchDataImpl value, $Res Function(_$FetchDataImpl) then) =
      __$$FetchDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchDataImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$FetchDataImpl>
    implements _$$FetchDataImplCopyWith<$Res> {
  __$$FetchDataImplCopyWithImpl(
      _$FetchDataImpl _value, $Res Function(_$FetchDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchDataImpl implements FetchData {
  const _$FetchDataImpl();

  @override
  String toString() {
    return 'HomeEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(List<Category> categories, List<Game> games) save,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(List<Category> categories, List<Game> games)? save,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(List<Category> categories, List<Game> games)? save,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchData value) fetch,
    required TResult Function(SaveData value) save,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchData value)? fetch,
    TResult? Function(SaveData value)? save,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchData value)? fetch,
    TResult Function(SaveData value)? save,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchData implements HomeEvent {
  const factory FetchData() = _$FetchDataImpl;
}

/// @nodoc
abstract class _$$SaveDataImplCopyWith<$Res> {
  factory _$$SaveDataImplCopyWith(
          _$SaveDataImpl value, $Res Function(_$SaveDataImpl) then) =
      __$$SaveDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Category> categories, List<Game> games});
}

/// @nodoc
class __$$SaveDataImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$SaveDataImpl>
    implements _$$SaveDataImplCopyWith<$Res> {
  __$$SaveDataImplCopyWithImpl(
      _$SaveDataImpl _value, $Res Function(_$SaveDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? games = null,
  }) {
    return _then(_$SaveDataImpl(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      null == games
          ? _value._games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
    ));
  }
}

/// @nodoc

class _$SaveDataImpl implements SaveData {
  const _$SaveDataImpl(final List<Category> categories, final List<Game> games)
      : _categories = categories,
        _games = games;

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Game> _games;
  @override
  List<Game> get games {
    if (_games is EqualUnmodifiableListView) return _games;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_games);
  }

  @override
  String toString() {
    return 'HomeEvent.save(categories: $categories, games: $games)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveDataImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._games, _games));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_games));

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveDataImplCopyWith<_$SaveDataImpl> get copyWith =>
      __$$SaveDataImplCopyWithImpl<_$SaveDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(List<Category> categories, List<Game> games) save,
  }) {
    return save(categories, games);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(List<Category> categories, List<Game> games)? save,
  }) {
    return save?.call(categories, games);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(List<Category> categories, List<Game> games)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(categories, games);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchData value) fetch,
    required TResult Function(SaveData value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchData value)? fetch,
    TResult? Function(SaveData value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchData value)? fetch,
    TResult Function(SaveData value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class SaveData implements HomeEvent {
  const factory SaveData(
      final List<Category> categories, final List<Game> games) = _$SaveDataImpl;

  List<Category> get categories;
  List<Game> get games;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveDataImplCopyWith<_$SaveDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<Category> categories, List<Game> games)
        fetched,
    required TResult Function(String feedback) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<Category> categories, List<Game> games)? fetched,
    TResult? Function(String feedback)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<Category> categories, List<Game> games)? fetched,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedState value) fetched,
    required TResult Function(HomeFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedState value)? fetched,
    TResult? Function(HomeFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedState value)? fetched,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl();

  @override
  String toString() {
    return 'HomeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<Category> categories, List<Game> games)
        fetched,
    required TResult Function(String feedback) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<Category> categories, List<Game> games)? fetched,
    TResult? Function(String feedback)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<Category> categories, List<Game> games)? fetched,
    TResult Function(String feedback)? failure,
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
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedState value) fetched,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedState value)? fetched,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedState value)? fetched,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _HomeState implements HomeState {
  const factory _HomeState() = _$HomeStateImpl;
}

/// @nodoc
abstract class _$$HomeLoadedStateImplCopyWith<$Res> {
  factory _$$HomeLoadedStateImplCopyWith(_$HomeLoadedStateImpl value,
          $Res Function(_$HomeLoadedStateImpl) then) =
      __$$HomeLoadedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeLoadedStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeLoadedStateImpl>
    implements _$$HomeLoadedStateImplCopyWith<$Res> {
  __$$HomeLoadedStateImplCopyWithImpl(
      _$HomeLoadedStateImpl _value, $Res Function(_$HomeLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeLoadedStateImpl implements HomeLoadedState {
  const _$HomeLoadedStateImpl();

  @override
  String toString() {
    return 'HomeState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeLoadedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<Category> categories, List<Game> games)
        fetched,
    required TResult Function(String feedback) failure,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<Category> categories, List<Game> games)? fetched,
    TResult? Function(String feedback)? failure,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<Category> categories, List<Game> games)? fetched,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedState value) fetched,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedState value)? fetched,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedState value)? fetched,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomeLoadedState implements HomeState {
  const factory HomeLoadedState() = _$HomeLoadedStateImpl;
}

/// @nodoc
abstract class _$$HomeLoadingStateImplCopyWith<$Res> {
  factory _$$HomeLoadingStateImplCopyWith(_$HomeLoadingStateImpl value,
          $Res Function(_$HomeLoadingStateImpl) then) =
      __$$HomeLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeLoadingStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeLoadingStateImpl>
    implements _$$HomeLoadingStateImplCopyWith<$Res> {
  __$$HomeLoadingStateImplCopyWithImpl(_$HomeLoadingStateImpl _value,
      $Res Function(_$HomeLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeLoadingStateImpl implements HomeLoadingState {
  const _$HomeLoadingStateImpl();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<Category> categories, List<Game> games)
        fetched,
    required TResult Function(String feedback) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<Category> categories, List<Game> games)? fetched,
    TResult? Function(String feedback)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<Category> categories, List<Game> games)? fetched,
    TResult Function(String feedback)? failure,
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
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedState value) fetched,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedState value)? fetched,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedState value)? fetched,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeLoadingState implements HomeState {
  const factory HomeLoadingState() = _$HomeLoadingStateImpl;
}

/// @nodoc
abstract class _$$HomeSuccessStateImplCopyWith<$Res> {
  factory _$$HomeSuccessStateImplCopyWith(_$HomeSuccessStateImpl value,
          $Res Function(_$HomeSuccessStateImpl) then) =
      __$$HomeSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeSuccessStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeSuccessStateImpl>
    implements _$$HomeSuccessStateImplCopyWith<$Res> {
  __$$HomeSuccessStateImplCopyWithImpl(_$HomeSuccessStateImpl _value,
      $Res Function(_$HomeSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeSuccessStateImpl implements HomeSuccessState {
  const _$HomeSuccessStateImpl();

  @override
  String toString() {
    return 'HomeState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeSuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<Category> categories, List<Game> games)
        fetched,
    required TResult Function(String feedback) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<Category> categories, List<Game> games)? fetched,
    TResult? Function(String feedback)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<Category> categories, List<Game> games)? fetched,
    TResult Function(String feedback)? failure,
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
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedState value) fetched,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedState value)? fetched,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedState value)? fetched,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class HomeSuccessState implements HomeState {
  const factory HomeSuccessState() = _$HomeSuccessStateImpl;
}

/// @nodoc
abstract class _$$HomeFetchedStateImplCopyWith<$Res> {
  factory _$$HomeFetchedStateImplCopyWith(_$HomeFetchedStateImpl value,
          $Res Function(_$HomeFetchedStateImpl) then) =
      __$$HomeFetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Category> categories, List<Game> games});
}

/// @nodoc
class __$$HomeFetchedStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeFetchedStateImpl>
    implements _$$HomeFetchedStateImplCopyWith<$Res> {
  __$$HomeFetchedStateImplCopyWithImpl(_$HomeFetchedStateImpl _value,
      $Res Function(_$HomeFetchedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? games = null,
  }) {
    return _then(_$HomeFetchedStateImpl(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      null == games
          ? _value._games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
    ));
  }
}

/// @nodoc

class _$HomeFetchedStateImpl implements HomeFetchedState {
  const _$HomeFetchedStateImpl(
      final List<Category> categories, final List<Game> games)
      : _categories = categories,
        _games = games;

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Game> _games;
  @override
  List<Game> get games {
    if (_games is EqualUnmodifiableListView) return _games;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_games);
  }

  @override
  String toString() {
    return 'HomeState.fetched(categories: $categories, games: $games)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeFetchedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._games, _games));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_games));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeFetchedStateImplCopyWith<_$HomeFetchedStateImpl> get copyWith =>
      __$$HomeFetchedStateImplCopyWithImpl<_$HomeFetchedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<Category> categories, List<Game> games)
        fetched,
    required TResult Function(String feedback) failure,
  }) {
    return fetched(categories, games);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<Category> categories, List<Game> games)? fetched,
    TResult? Function(String feedback)? failure,
  }) {
    return fetched?.call(categories, games);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<Category> categories, List<Game> games)? fetched,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(categories, games);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedState value) fetched,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedState value)? fetched,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedState value)? fetched,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class HomeFetchedState implements HomeState {
  const factory HomeFetchedState(
          final List<Category> categories, final List<Game> games) =
      _$HomeFetchedStateImpl;

  List<Category> get categories;
  List<Game> get games;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeFetchedStateImplCopyWith<_$HomeFetchedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeFailureStateImplCopyWith<$Res> {
  factory _$$HomeFailureStateImplCopyWith(_$HomeFailureStateImpl value,
          $Res Function(_$HomeFailureStateImpl) then) =
      __$$HomeFailureStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String feedback});
}

/// @nodoc
class __$$HomeFailureStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeFailureStateImpl>
    implements _$$HomeFailureStateImplCopyWith<$Res> {
  __$$HomeFailureStateImplCopyWithImpl(_$HomeFailureStateImpl _value,
      $Res Function(_$HomeFailureStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = null,
  }) {
    return _then(_$HomeFailureStateImpl(
      null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeFailureStateImpl implements HomeFailureState {
  const _$HomeFailureStateImpl(this.feedback);

  @override
  final String feedback;

  @override
  String toString() {
    return 'HomeState.failure(feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeFailureStateImpl &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedback);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeFailureStateImplCopyWith<_$HomeFailureStateImpl> get copyWith =>
      __$$HomeFailureStateImplCopyWithImpl<_$HomeFailureStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<Category> categories, List<Game> games)
        fetched,
    required TResult Function(String feedback) failure,
  }) {
    return failure(feedback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<Category> categories, List<Game> games)? fetched,
    TResult? Function(String feedback)? failure,
  }) {
    return failure?.call(feedback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<Category> categories, List<Game> games)? fetched,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(feedback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedState value) fetched,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedState value)? fetched,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedState value)? fetched,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class HomeFailureState implements HomeState {
  const factory HomeFailureState(final String feedback) =
      _$HomeFailureStateImpl;

  String get feedback;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeFailureStateImplCopyWith<_$HomeFailureStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
