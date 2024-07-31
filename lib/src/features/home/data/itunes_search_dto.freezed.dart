// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itunes_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItunesSearchDto _$ItunesSearchDtoFromJson(Map<String, dynamic> json) {
  return _ItunesSearchDto.fromJson(json);
}

/// @nodoc
mixin _$ItunesSearchDto {
  @JsonKey(name: "resultCount")
  int? get resultCount => throw _privateConstructorUsedError;
  @JsonKey(name: "results")
  List<ItunesSearchResult>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItunesSearchDtoCopyWith<ItunesSearchDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItunesSearchDtoCopyWith<$Res> {
  factory $ItunesSearchDtoCopyWith(
          ItunesSearchDto value, $Res Function(ItunesSearchDto) then) =
      _$ItunesSearchDtoCopyWithImpl<$Res, ItunesSearchDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "resultCount") int? resultCount,
      @JsonKey(name: "results") List<ItunesSearchResult>? results});
}

/// @nodoc
class _$ItunesSearchDtoCopyWithImpl<$Res, $Val extends ItunesSearchDto>
    implements $ItunesSearchDtoCopyWith<$Res> {
  _$ItunesSearchDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultCount = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      resultCount: freezed == resultCount
          ? _value.resultCount
          : resultCount // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ItunesSearchResult>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItunesSearchDtoImplCopyWith<$Res>
    implements $ItunesSearchDtoCopyWith<$Res> {
  factory _$$ItunesSearchDtoImplCopyWith(_$ItunesSearchDtoImpl value,
          $Res Function(_$ItunesSearchDtoImpl) then) =
      __$$ItunesSearchDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "resultCount") int? resultCount,
      @JsonKey(name: "results") List<ItunesSearchResult>? results});
}

/// @nodoc
class __$$ItunesSearchDtoImplCopyWithImpl<$Res>
    extends _$ItunesSearchDtoCopyWithImpl<$Res, _$ItunesSearchDtoImpl>
    implements _$$ItunesSearchDtoImplCopyWith<$Res> {
  __$$ItunesSearchDtoImplCopyWithImpl(
      _$ItunesSearchDtoImpl _value, $Res Function(_$ItunesSearchDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultCount = freezed,
    Object? results = freezed,
  }) {
    return _then(_$ItunesSearchDtoImpl(
      resultCount: freezed == resultCount
          ? _value.resultCount
          : resultCount // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ItunesSearchResult>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItunesSearchDtoImpl implements _ItunesSearchDto {
  const _$ItunesSearchDtoImpl(
      {@JsonKey(name: "resultCount") this.resultCount,
      @JsonKey(name: "results") final List<ItunesSearchResult>? results})
      : _results = results;

  factory _$ItunesSearchDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItunesSearchDtoImplFromJson(json);

  @override
  @JsonKey(name: "resultCount")
  final int? resultCount;
  final List<ItunesSearchResult>? _results;
  @override
  @JsonKey(name: "results")
  List<ItunesSearchResult>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ItunesSearchDto(resultCount: $resultCount, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItunesSearchDtoImpl &&
            (identical(other.resultCount, resultCount) ||
                other.resultCount == resultCount) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, resultCount, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItunesSearchDtoImplCopyWith<_$ItunesSearchDtoImpl> get copyWith =>
      __$$ItunesSearchDtoImplCopyWithImpl<_$ItunesSearchDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItunesSearchDtoImplToJson(
      this,
    );
  }
}

abstract class _ItunesSearchDto implements ItunesSearchDto {
  const factory _ItunesSearchDto(
          {@JsonKey(name: "resultCount") final int? resultCount,
          @JsonKey(name: "results") final List<ItunesSearchResult>? results}) =
      _$ItunesSearchDtoImpl;

  factory _ItunesSearchDto.fromJson(Map<String, dynamic> json) =
      _$ItunesSearchDtoImpl.fromJson;

  @override
  @JsonKey(name: "resultCount")
  int? get resultCount;
  @override
  @JsonKey(name: "results")
  List<ItunesSearchResult>? get results;
  @override
  @JsonKey(ignore: true)
  _$$ItunesSearchDtoImplCopyWith<_$ItunesSearchDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItunesSearchResult _$ItunesSearchResultFromJson(Map<String, dynamic> json) {
  return _ItunesSearchResult.fromJson(json);
}

/// @nodoc
mixin _$ItunesSearchResult {
  @JsonKey(name: "wrapperType")
  String? get wrapperType => throw _privateConstructorUsedError;
  @JsonKey(name: "kind")
  String? get kind => throw _privateConstructorUsedError;
  @JsonKey(name: "artistId")
  int? get artistId => throw _privateConstructorUsedError;
  @JsonKey(name: "collectionId")
  int? get collectionId => throw _privateConstructorUsedError;
  @JsonKey(name: "trackId")
  int? get trackId => throw _privateConstructorUsedError;
  @JsonKey(name: "artistName")
  String? get artistName => throw _privateConstructorUsedError;
  @JsonKey(name: "collectionName")
  String? get collectionName => throw _privateConstructorUsedError;
  @JsonKey(name: "trackName")
  String? get trackName => throw _privateConstructorUsedError;
  @JsonKey(name: "collectionCensoredName")
  String? get collectionCensoredName => throw _privateConstructorUsedError;
  @JsonKey(name: "trackCensoredName")
  String? get trackCensoredName => throw _privateConstructorUsedError;
  @JsonKey(name: "artistViewUrl")
  String? get artistViewUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "collectionViewUrl")
  String? get collectionViewUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "trackViewUrl")
  String? get trackViewUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "previewUrl")
  String? get previewUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "artworkUrl30")
  String? get artworkUrl30 => throw _privateConstructorUsedError;
  @JsonKey(name: "artworkUrl60")
  String? get artworkUrl60 => throw _privateConstructorUsedError;
  @JsonKey(name: "artworkUrl100")
  String? get artworkUrl100 => throw _privateConstructorUsedError;
  @JsonKey(name: "collectionPrice")
  double? get collectionPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "trackPrice")
  double? get trackPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "releaseDate")
  String? get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: "collectionExplicitness")
  String? get collectionExplicitness => throw _privateConstructorUsedError;
  @JsonKey(name: "trackExplicitness")
  String? get trackExplicitness => throw _privateConstructorUsedError;
  @JsonKey(name: "discCount")
  int? get discCount => throw _privateConstructorUsedError;
  @JsonKey(name: "discNumber")
  int? get discNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "trackCount")
  int? get trackCount => throw _privateConstructorUsedError;
  @JsonKey(name: "trackNumber")
  int? get trackNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "trackTimeMillis")
  int? get trackTimeMillis => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "primaryGenreName")
  String? get primaryGenreName => throw _privateConstructorUsedError;
  @JsonKey(name: "isStreamable")
  bool? get isStreamable => throw _privateConstructorUsedError;
  @JsonKey(name: "collectionArtistName")
  String? get collectionArtistName => throw _privateConstructorUsedError;
  @JsonKey(name: "collectionArtistId")
  int? get collectionArtistId => throw _privateConstructorUsedError;
  @JsonKey(name: "collectionArtistViewUrl")
  String? get collectionArtistViewUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "contentAdvisoryRating")
  String? get contentAdvisoryRating => throw _privateConstructorUsedError;
  @JsonKey(name: "trackRentalPrice")
  double? get trackRentalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "collectionHdPrice")
  double? get collectionHdPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "trackHdPrice")
  double? get trackHdPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "trackHdRentalPrice")
  double? get trackHdRentalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "shortDescription")
  String? get shortDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "longDescription")
  String? get longDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "hasITunesExtras")
  bool? get hasITunesExtras => throw _privateConstructorUsedError;
  @JsonKey(name: "copyright")
  String? get copyright => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "feedUrl")
  String? get feedUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "artworkUrl600")
  String? get artworkUrl600 => throw _privateConstructorUsedError;
  @JsonKey(name: "genreIds")
  List<String>? get genreIds => throw _privateConstructorUsedError;
  @JsonKey(name: "genres")
  List<String>? get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItunesSearchResultCopyWith<ItunesSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItunesSearchResultCopyWith<$Res> {
  factory $ItunesSearchResultCopyWith(
          ItunesSearchResult value, $Res Function(ItunesSearchResult) then) =
      _$ItunesSearchResultCopyWithImpl<$Res, ItunesSearchResult>;
  @useResult
  $Res call(
      {@JsonKey(name: "wrapperType") String? wrapperType,
      @JsonKey(name: "kind") String? kind,
      @JsonKey(name: "artistId") int? artistId,
      @JsonKey(name: "collectionId") int? collectionId,
      @JsonKey(name: "trackId") int? trackId,
      @JsonKey(name: "artistName") String? artistName,
      @JsonKey(name: "collectionName") String? collectionName,
      @JsonKey(name: "trackName") String? trackName,
      @JsonKey(name: "collectionCensoredName") String? collectionCensoredName,
      @JsonKey(name: "trackCensoredName") String? trackCensoredName,
      @JsonKey(name: "artistViewUrl") String? artistViewUrl,
      @JsonKey(name: "collectionViewUrl") String? collectionViewUrl,
      @JsonKey(name: "trackViewUrl") String? trackViewUrl,
      @JsonKey(name: "previewUrl") String? previewUrl,
      @JsonKey(name: "artworkUrl30") String? artworkUrl30,
      @JsonKey(name: "artworkUrl60") String? artworkUrl60,
      @JsonKey(name: "artworkUrl100") String? artworkUrl100,
      @JsonKey(name: "collectionPrice") double? collectionPrice,
      @JsonKey(name: "trackPrice") double? trackPrice,
      @JsonKey(name: "releaseDate") String? releaseDate,
      @JsonKey(name: "collectionExplicitness") String? collectionExplicitness,
      @JsonKey(name: "trackExplicitness") String? trackExplicitness,
      @JsonKey(name: "discCount") int? discCount,
      @JsonKey(name: "discNumber") int? discNumber,
      @JsonKey(name: "trackCount") int? trackCount,
      @JsonKey(name: "trackNumber") int? trackNumber,
      @JsonKey(name: "trackTimeMillis") int? trackTimeMillis,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "primaryGenreName") String? primaryGenreName,
      @JsonKey(name: "isStreamable") bool? isStreamable,
      @JsonKey(name: "collectionArtistName") String? collectionArtistName,
      @JsonKey(name: "collectionArtistId") int? collectionArtistId,
      @JsonKey(name: "collectionArtistViewUrl") String? collectionArtistViewUrl,
      @JsonKey(name: "contentAdvisoryRating") String? contentAdvisoryRating,
      @JsonKey(name: "trackRentalPrice") double? trackRentalPrice,
      @JsonKey(name: "collectionHdPrice") double? collectionHdPrice,
      @JsonKey(name: "trackHdPrice") double? trackHdPrice,
      @JsonKey(name: "trackHdRentalPrice") double? trackHdRentalPrice,
      @JsonKey(name: "shortDescription") String? shortDescription,
      @JsonKey(name: "longDescription") String? longDescription,
      @JsonKey(name: "hasITunesExtras") bool? hasITunesExtras,
      @JsonKey(name: "copyright") String? copyright,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "feedUrl") String? feedUrl,
      @JsonKey(name: "artworkUrl600") String? artworkUrl600,
      @JsonKey(name: "genreIds") List<String>? genreIds,
      @JsonKey(name: "genres") List<String>? genres});
}

/// @nodoc
class _$ItunesSearchResultCopyWithImpl<$Res, $Val extends ItunesSearchResult>
    implements $ItunesSearchResultCopyWith<$Res> {
  _$ItunesSearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wrapperType = freezed,
    Object? kind = freezed,
    Object? artistId = freezed,
    Object? collectionId = freezed,
    Object? trackId = freezed,
    Object? artistName = freezed,
    Object? collectionName = freezed,
    Object? trackName = freezed,
    Object? collectionCensoredName = freezed,
    Object? trackCensoredName = freezed,
    Object? artistViewUrl = freezed,
    Object? collectionViewUrl = freezed,
    Object? trackViewUrl = freezed,
    Object? previewUrl = freezed,
    Object? artworkUrl30 = freezed,
    Object? artworkUrl60 = freezed,
    Object? artworkUrl100 = freezed,
    Object? collectionPrice = freezed,
    Object? trackPrice = freezed,
    Object? releaseDate = freezed,
    Object? collectionExplicitness = freezed,
    Object? trackExplicitness = freezed,
    Object? discCount = freezed,
    Object? discNumber = freezed,
    Object? trackCount = freezed,
    Object? trackNumber = freezed,
    Object? trackTimeMillis = freezed,
    Object? country = freezed,
    Object? currency = freezed,
    Object? primaryGenreName = freezed,
    Object? isStreamable = freezed,
    Object? collectionArtistName = freezed,
    Object? collectionArtistId = freezed,
    Object? collectionArtistViewUrl = freezed,
    Object? contentAdvisoryRating = freezed,
    Object? trackRentalPrice = freezed,
    Object? collectionHdPrice = freezed,
    Object? trackHdPrice = freezed,
    Object? trackHdRentalPrice = freezed,
    Object? shortDescription = freezed,
    Object? longDescription = freezed,
    Object? hasITunesExtras = freezed,
    Object? copyright = freezed,
    Object? description = freezed,
    Object? feedUrl = freezed,
    Object? artworkUrl600 = freezed,
    Object? genreIds = freezed,
    Object? genres = freezed,
  }) {
    return _then(_value.copyWith(
      wrapperType: freezed == wrapperType
          ? _value.wrapperType
          : wrapperType // ignore: cast_nullable_to_non_nullable
              as String?,
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      artistId: freezed == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as int?,
      collectionId: freezed == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      trackId: freezed == trackId
          ? _value.trackId
          : trackId // ignore: cast_nullable_to_non_nullable
              as int?,
      artistName: freezed == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionName: freezed == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String?,
      trackName: freezed == trackName
          ? _value.trackName
          : trackName // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionCensoredName: freezed == collectionCensoredName
          ? _value.collectionCensoredName
          : collectionCensoredName // ignore: cast_nullable_to_non_nullable
              as String?,
      trackCensoredName: freezed == trackCensoredName
          ? _value.trackCensoredName
          : trackCensoredName // ignore: cast_nullable_to_non_nullable
              as String?,
      artistViewUrl: freezed == artistViewUrl
          ? _value.artistViewUrl
          : artistViewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionViewUrl: freezed == collectionViewUrl
          ? _value.collectionViewUrl
          : collectionViewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      trackViewUrl: freezed == trackViewUrl
          ? _value.trackViewUrl
          : trackViewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      artworkUrl30: freezed == artworkUrl30
          ? _value.artworkUrl30
          : artworkUrl30 // ignore: cast_nullable_to_non_nullable
              as String?,
      artworkUrl60: freezed == artworkUrl60
          ? _value.artworkUrl60
          : artworkUrl60 // ignore: cast_nullable_to_non_nullable
              as String?,
      artworkUrl100: freezed == artworkUrl100
          ? _value.artworkUrl100
          : artworkUrl100 // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionPrice: freezed == collectionPrice
          ? _value.collectionPrice
          : collectionPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      trackPrice: freezed == trackPrice
          ? _value.trackPrice
          : trackPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionExplicitness: freezed == collectionExplicitness
          ? _value.collectionExplicitness
          : collectionExplicitness // ignore: cast_nullable_to_non_nullable
              as String?,
      trackExplicitness: freezed == trackExplicitness
          ? _value.trackExplicitness
          : trackExplicitness // ignore: cast_nullable_to_non_nullable
              as String?,
      discCount: freezed == discCount
          ? _value.discCount
          : discCount // ignore: cast_nullable_to_non_nullable
              as int?,
      discNumber: freezed == discNumber
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      trackCount: freezed == trackCount
          ? _value.trackCount
          : trackCount // ignore: cast_nullable_to_non_nullable
              as int?,
      trackNumber: freezed == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      trackTimeMillis: freezed == trackTimeMillis
          ? _value.trackTimeMillis
          : trackTimeMillis // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryGenreName: freezed == primaryGenreName
          ? _value.primaryGenreName
          : primaryGenreName // ignore: cast_nullable_to_non_nullable
              as String?,
      isStreamable: freezed == isStreamable
          ? _value.isStreamable
          : isStreamable // ignore: cast_nullable_to_non_nullable
              as bool?,
      collectionArtistName: freezed == collectionArtistName
          ? _value.collectionArtistName
          : collectionArtistName // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionArtistId: freezed == collectionArtistId
          ? _value.collectionArtistId
          : collectionArtistId // ignore: cast_nullable_to_non_nullable
              as int?,
      collectionArtistViewUrl: freezed == collectionArtistViewUrl
          ? _value.collectionArtistViewUrl
          : collectionArtistViewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      contentAdvisoryRating: freezed == contentAdvisoryRating
          ? _value.contentAdvisoryRating
          : contentAdvisoryRating // ignore: cast_nullable_to_non_nullable
              as String?,
      trackRentalPrice: freezed == trackRentalPrice
          ? _value.trackRentalPrice
          : trackRentalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      collectionHdPrice: freezed == collectionHdPrice
          ? _value.collectionHdPrice
          : collectionHdPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      trackHdPrice: freezed == trackHdPrice
          ? _value.trackHdPrice
          : trackHdPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      trackHdRentalPrice: freezed == trackHdRentalPrice
          ? _value.trackHdRentalPrice
          : trackHdRentalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      longDescription: freezed == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      hasITunesExtras: freezed == hasITunesExtras
          ? _value.hasITunesExtras
          : hasITunesExtras // ignore: cast_nullable_to_non_nullable
              as bool?,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      feedUrl: freezed == feedUrl
          ? _value.feedUrl
          : feedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      artworkUrl600: freezed == artworkUrl600
          ? _value.artworkUrl600
          : artworkUrl600 // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: freezed == genreIds
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItunesSearchResultImplCopyWith<$Res>
    implements $ItunesSearchResultCopyWith<$Res> {
  factory _$$ItunesSearchResultImplCopyWith(_$ItunesSearchResultImpl value,
          $Res Function(_$ItunesSearchResultImpl) then) =
      __$$ItunesSearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "wrapperType") String? wrapperType,
      @JsonKey(name: "kind") String? kind,
      @JsonKey(name: "artistId") int? artistId,
      @JsonKey(name: "collectionId") int? collectionId,
      @JsonKey(name: "trackId") int? trackId,
      @JsonKey(name: "artistName") String? artistName,
      @JsonKey(name: "collectionName") String? collectionName,
      @JsonKey(name: "trackName") String? trackName,
      @JsonKey(name: "collectionCensoredName") String? collectionCensoredName,
      @JsonKey(name: "trackCensoredName") String? trackCensoredName,
      @JsonKey(name: "artistViewUrl") String? artistViewUrl,
      @JsonKey(name: "collectionViewUrl") String? collectionViewUrl,
      @JsonKey(name: "trackViewUrl") String? trackViewUrl,
      @JsonKey(name: "previewUrl") String? previewUrl,
      @JsonKey(name: "artworkUrl30") String? artworkUrl30,
      @JsonKey(name: "artworkUrl60") String? artworkUrl60,
      @JsonKey(name: "artworkUrl100") String? artworkUrl100,
      @JsonKey(name: "collectionPrice") double? collectionPrice,
      @JsonKey(name: "trackPrice") double? trackPrice,
      @JsonKey(name: "releaseDate") String? releaseDate,
      @JsonKey(name: "collectionExplicitness") String? collectionExplicitness,
      @JsonKey(name: "trackExplicitness") String? trackExplicitness,
      @JsonKey(name: "discCount") int? discCount,
      @JsonKey(name: "discNumber") int? discNumber,
      @JsonKey(name: "trackCount") int? trackCount,
      @JsonKey(name: "trackNumber") int? trackNumber,
      @JsonKey(name: "trackTimeMillis") int? trackTimeMillis,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "primaryGenreName") String? primaryGenreName,
      @JsonKey(name: "isStreamable") bool? isStreamable,
      @JsonKey(name: "collectionArtistName") String? collectionArtistName,
      @JsonKey(name: "collectionArtistId") int? collectionArtistId,
      @JsonKey(name: "collectionArtistViewUrl") String? collectionArtistViewUrl,
      @JsonKey(name: "contentAdvisoryRating") String? contentAdvisoryRating,
      @JsonKey(name: "trackRentalPrice") double? trackRentalPrice,
      @JsonKey(name: "collectionHdPrice") double? collectionHdPrice,
      @JsonKey(name: "trackHdPrice") double? trackHdPrice,
      @JsonKey(name: "trackHdRentalPrice") double? trackHdRentalPrice,
      @JsonKey(name: "shortDescription") String? shortDescription,
      @JsonKey(name: "longDescription") String? longDescription,
      @JsonKey(name: "hasITunesExtras") bool? hasITunesExtras,
      @JsonKey(name: "copyright") String? copyright,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "feedUrl") String? feedUrl,
      @JsonKey(name: "artworkUrl600") String? artworkUrl600,
      @JsonKey(name: "genreIds") List<String>? genreIds,
      @JsonKey(name: "genres") List<String>? genres});
}

/// @nodoc
class __$$ItunesSearchResultImplCopyWithImpl<$Res>
    extends _$ItunesSearchResultCopyWithImpl<$Res, _$ItunesSearchResultImpl>
    implements _$$ItunesSearchResultImplCopyWith<$Res> {
  __$$ItunesSearchResultImplCopyWithImpl(_$ItunesSearchResultImpl _value,
      $Res Function(_$ItunesSearchResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wrapperType = freezed,
    Object? kind = freezed,
    Object? artistId = freezed,
    Object? collectionId = freezed,
    Object? trackId = freezed,
    Object? artistName = freezed,
    Object? collectionName = freezed,
    Object? trackName = freezed,
    Object? collectionCensoredName = freezed,
    Object? trackCensoredName = freezed,
    Object? artistViewUrl = freezed,
    Object? collectionViewUrl = freezed,
    Object? trackViewUrl = freezed,
    Object? previewUrl = freezed,
    Object? artworkUrl30 = freezed,
    Object? artworkUrl60 = freezed,
    Object? artworkUrl100 = freezed,
    Object? collectionPrice = freezed,
    Object? trackPrice = freezed,
    Object? releaseDate = freezed,
    Object? collectionExplicitness = freezed,
    Object? trackExplicitness = freezed,
    Object? discCount = freezed,
    Object? discNumber = freezed,
    Object? trackCount = freezed,
    Object? trackNumber = freezed,
    Object? trackTimeMillis = freezed,
    Object? country = freezed,
    Object? currency = freezed,
    Object? primaryGenreName = freezed,
    Object? isStreamable = freezed,
    Object? collectionArtistName = freezed,
    Object? collectionArtistId = freezed,
    Object? collectionArtistViewUrl = freezed,
    Object? contentAdvisoryRating = freezed,
    Object? trackRentalPrice = freezed,
    Object? collectionHdPrice = freezed,
    Object? trackHdPrice = freezed,
    Object? trackHdRentalPrice = freezed,
    Object? shortDescription = freezed,
    Object? longDescription = freezed,
    Object? hasITunesExtras = freezed,
    Object? copyright = freezed,
    Object? description = freezed,
    Object? feedUrl = freezed,
    Object? artworkUrl600 = freezed,
    Object? genreIds = freezed,
    Object? genres = freezed,
  }) {
    return _then(_$ItunesSearchResultImpl(
      wrapperType: freezed == wrapperType
          ? _value.wrapperType
          : wrapperType // ignore: cast_nullable_to_non_nullable
              as String?,
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      artistId: freezed == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as int?,
      collectionId: freezed == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      trackId: freezed == trackId
          ? _value.trackId
          : trackId // ignore: cast_nullable_to_non_nullable
              as int?,
      artistName: freezed == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionName: freezed == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String?,
      trackName: freezed == trackName
          ? _value.trackName
          : trackName // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionCensoredName: freezed == collectionCensoredName
          ? _value.collectionCensoredName
          : collectionCensoredName // ignore: cast_nullable_to_non_nullable
              as String?,
      trackCensoredName: freezed == trackCensoredName
          ? _value.trackCensoredName
          : trackCensoredName // ignore: cast_nullable_to_non_nullable
              as String?,
      artistViewUrl: freezed == artistViewUrl
          ? _value.artistViewUrl
          : artistViewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionViewUrl: freezed == collectionViewUrl
          ? _value.collectionViewUrl
          : collectionViewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      trackViewUrl: freezed == trackViewUrl
          ? _value.trackViewUrl
          : trackViewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      artworkUrl30: freezed == artworkUrl30
          ? _value.artworkUrl30
          : artworkUrl30 // ignore: cast_nullable_to_non_nullable
              as String?,
      artworkUrl60: freezed == artworkUrl60
          ? _value.artworkUrl60
          : artworkUrl60 // ignore: cast_nullable_to_non_nullable
              as String?,
      artworkUrl100: freezed == artworkUrl100
          ? _value.artworkUrl100
          : artworkUrl100 // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionPrice: freezed == collectionPrice
          ? _value.collectionPrice
          : collectionPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      trackPrice: freezed == trackPrice
          ? _value.trackPrice
          : trackPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionExplicitness: freezed == collectionExplicitness
          ? _value.collectionExplicitness
          : collectionExplicitness // ignore: cast_nullable_to_non_nullable
              as String?,
      trackExplicitness: freezed == trackExplicitness
          ? _value.trackExplicitness
          : trackExplicitness // ignore: cast_nullable_to_non_nullable
              as String?,
      discCount: freezed == discCount
          ? _value.discCount
          : discCount // ignore: cast_nullable_to_non_nullable
              as int?,
      discNumber: freezed == discNumber
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      trackCount: freezed == trackCount
          ? _value.trackCount
          : trackCount // ignore: cast_nullable_to_non_nullable
              as int?,
      trackNumber: freezed == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      trackTimeMillis: freezed == trackTimeMillis
          ? _value.trackTimeMillis
          : trackTimeMillis // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryGenreName: freezed == primaryGenreName
          ? _value.primaryGenreName
          : primaryGenreName // ignore: cast_nullable_to_non_nullable
              as String?,
      isStreamable: freezed == isStreamable
          ? _value.isStreamable
          : isStreamable // ignore: cast_nullable_to_non_nullable
              as bool?,
      collectionArtistName: freezed == collectionArtistName
          ? _value.collectionArtistName
          : collectionArtistName // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionArtistId: freezed == collectionArtistId
          ? _value.collectionArtistId
          : collectionArtistId // ignore: cast_nullable_to_non_nullable
              as int?,
      collectionArtistViewUrl: freezed == collectionArtistViewUrl
          ? _value.collectionArtistViewUrl
          : collectionArtistViewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      contentAdvisoryRating: freezed == contentAdvisoryRating
          ? _value.contentAdvisoryRating
          : contentAdvisoryRating // ignore: cast_nullable_to_non_nullable
              as String?,
      trackRentalPrice: freezed == trackRentalPrice
          ? _value.trackRentalPrice
          : trackRentalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      collectionHdPrice: freezed == collectionHdPrice
          ? _value.collectionHdPrice
          : collectionHdPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      trackHdPrice: freezed == trackHdPrice
          ? _value.trackHdPrice
          : trackHdPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      trackHdRentalPrice: freezed == trackHdRentalPrice
          ? _value.trackHdRentalPrice
          : trackHdRentalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      longDescription: freezed == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      hasITunesExtras: freezed == hasITunesExtras
          ? _value.hasITunesExtras
          : hasITunesExtras // ignore: cast_nullable_to_non_nullable
              as bool?,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      feedUrl: freezed == feedUrl
          ? _value.feedUrl
          : feedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      artworkUrl600: freezed == artworkUrl600
          ? _value.artworkUrl600
          : artworkUrl600 // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: freezed == genreIds
          ? _value._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItunesSearchResultImpl implements _ItunesSearchResult {
  const _$ItunesSearchResultImpl(
      {@JsonKey(name: "wrapperType") this.wrapperType,
      @JsonKey(name: "kind") this.kind,
      @JsonKey(name: "artistId") this.artistId,
      @JsonKey(name: "collectionId") this.collectionId,
      @JsonKey(name: "trackId") this.trackId,
      @JsonKey(name: "artistName") this.artistName,
      @JsonKey(name: "collectionName") this.collectionName,
      @JsonKey(name: "trackName") this.trackName,
      @JsonKey(name: "collectionCensoredName") this.collectionCensoredName,
      @JsonKey(name: "trackCensoredName") this.trackCensoredName,
      @JsonKey(name: "artistViewUrl") this.artistViewUrl,
      @JsonKey(name: "collectionViewUrl") this.collectionViewUrl,
      @JsonKey(name: "trackViewUrl") this.trackViewUrl,
      @JsonKey(name: "previewUrl") this.previewUrl,
      @JsonKey(name: "artworkUrl30") this.artworkUrl30,
      @JsonKey(name: "artworkUrl60") this.artworkUrl60,
      @JsonKey(name: "artworkUrl100") this.artworkUrl100,
      @JsonKey(name: "collectionPrice") this.collectionPrice,
      @JsonKey(name: "trackPrice") this.trackPrice,
      @JsonKey(name: "releaseDate") this.releaseDate,
      @JsonKey(name: "collectionExplicitness") this.collectionExplicitness,
      @JsonKey(name: "trackExplicitness") this.trackExplicitness,
      @JsonKey(name: "discCount") this.discCount,
      @JsonKey(name: "discNumber") this.discNumber,
      @JsonKey(name: "trackCount") this.trackCount,
      @JsonKey(name: "trackNumber") this.trackNumber,
      @JsonKey(name: "trackTimeMillis") this.trackTimeMillis,
      @JsonKey(name: "country") this.country,
      @JsonKey(name: "currency") this.currency,
      @JsonKey(name: "primaryGenreName") this.primaryGenreName,
      @JsonKey(name: "isStreamable") this.isStreamable,
      @JsonKey(name: "collectionArtistName") this.collectionArtistName,
      @JsonKey(name: "collectionArtistId") this.collectionArtistId,
      @JsonKey(name: "collectionArtistViewUrl") this.collectionArtistViewUrl,
      @JsonKey(name: "contentAdvisoryRating") this.contentAdvisoryRating,
      @JsonKey(name: "trackRentalPrice") this.trackRentalPrice,
      @JsonKey(name: "collectionHdPrice") this.collectionHdPrice,
      @JsonKey(name: "trackHdPrice") this.trackHdPrice,
      @JsonKey(name: "trackHdRentalPrice") this.trackHdRentalPrice,
      @JsonKey(name: "shortDescription") this.shortDescription,
      @JsonKey(name: "longDescription") this.longDescription,
      @JsonKey(name: "hasITunesExtras") this.hasITunesExtras,
      @JsonKey(name: "copyright") this.copyright,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "feedUrl") this.feedUrl,
      @JsonKey(name: "artworkUrl600") this.artworkUrl600,
      @JsonKey(name: "genreIds") final List<String>? genreIds,
      @JsonKey(name: "genres") final List<String>? genres})
      : _genreIds = genreIds,
        _genres = genres;

  factory _$ItunesSearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItunesSearchResultImplFromJson(json);

  @override
  @JsonKey(name: "wrapperType")
  final String? wrapperType;
  @override
  @JsonKey(name: "kind")
  final String? kind;
  @override
  @JsonKey(name: "artistId")
  final int? artistId;
  @override
  @JsonKey(name: "collectionId")
  final int? collectionId;
  @override
  @JsonKey(name: "trackId")
  final int? trackId;
  @override
  @JsonKey(name: "artistName")
  final String? artistName;
  @override
  @JsonKey(name: "collectionName")
  final String? collectionName;
  @override
  @JsonKey(name: "trackName")
  final String? trackName;
  @override
  @JsonKey(name: "collectionCensoredName")
  final String? collectionCensoredName;
  @override
  @JsonKey(name: "trackCensoredName")
  final String? trackCensoredName;
  @override
  @JsonKey(name: "artistViewUrl")
  final String? artistViewUrl;
  @override
  @JsonKey(name: "collectionViewUrl")
  final String? collectionViewUrl;
  @override
  @JsonKey(name: "trackViewUrl")
  final String? trackViewUrl;
  @override
  @JsonKey(name: "previewUrl")
  final String? previewUrl;
  @override
  @JsonKey(name: "artworkUrl30")
  final String? artworkUrl30;
  @override
  @JsonKey(name: "artworkUrl60")
  final String? artworkUrl60;
  @override
  @JsonKey(name: "artworkUrl100")
  final String? artworkUrl100;
  @override
  @JsonKey(name: "collectionPrice")
  final double? collectionPrice;
  @override
  @JsonKey(name: "trackPrice")
  final double? trackPrice;
  @override
  @JsonKey(name: "releaseDate")
  final String? releaseDate;
  @override
  @JsonKey(name: "collectionExplicitness")
  final String? collectionExplicitness;
  @override
  @JsonKey(name: "trackExplicitness")
  final String? trackExplicitness;
  @override
  @JsonKey(name: "discCount")
  final int? discCount;
  @override
  @JsonKey(name: "discNumber")
  final int? discNumber;
  @override
  @JsonKey(name: "trackCount")
  final int? trackCount;
  @override
  @JsonKey(name: "trackNumber")
  final int? trackNumber;
  @override
  @JsonKey(name: "trackTimeMillis")
  final int? trackTimeMillis;
  @override
  @JsonKey(name: "country")
  final String? country;
  @override
  @JsonKey(name: "currency")
  final String? currency;
  @override
  @JsonKey(name: "primaryGenreName")
  final String? primaryGenreName;
  @override
  @JsonKey(name: "isStreamable")
  final bool? isStreamable;
  @override
  @JsonKey(name: "collectionArtistName")
  final String? collectionArtistName;
  @override
  @JsonKey(name: "collectionArtistId")
  final int? collectionArtistId;
  @override
  @JsonKey(name: "collectionArtistViewUrl")
  final String? collectionArtistViewUrl;
  @override
  @JsonKey(name: "contentAdvisoryRating")
  final String? contentAdvisoryRating;
  @override
  @JsonKey(name: "trackRentalPrice")
  final double? trackRentalPrice;
  @override
  @JsonKey(name: "collectionHdPrice")
  final double? collectionHdPrice;
  @override
  @JsonKey(name: "trackHdPrice")
  final double? trackHdPrice;
  @override
  @JsonKey(name: "trackHdRentalPrice")
  final double? trackHdRentalPrice;
  @override
  @JsonKey(name: "shortDescription")
  final String? shortDescription;
  @override
  @JsonKey(name: "longDescription")
  final String? longDescription;
  @override
  @JsonKey(name: "hasITunesExtras")
  final bool? hasITunesExtras;
  @override
  @JsonKey(name: "copyright")
  final String? copyright;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "feedUrl")
  final String? feedUrl;
  @override
  @JsonKey(name: "artworkUrl600")
  final String? artworkUrl600;
  final List<String>? _genreIds;
  @override
  @JsonKey(name: "genreIds")
  List<String>? get genreIds {
    final value = _genreIds;
    if (value == null) return null;
    if (_genreIds is EqualUnmodifiableListView) return _genreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _genres;
  @override
  @JsonKey(name: "genres")
  List<String>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ItunesSearchResult(wrapperType: $wrapperType, kind: $kind, artistId: $artistId, collectionId: $collectionId, trackId: $trackId, artistName: $artistName, collectionName: $collectionName, trackName: $trackName, collectionCensoredName: $collectionCensoredName, trackCensoredName: $trackCensoredName, artistViewUrl: $artistViewUrl, collectionViewUrl: $collectionViewUrl, trackViewUrl: $trackViewUrl, previewUrl: $previewUrl, artworkUrl30: $artworkUrl30, artworkUrl60: $artworkUrl60, artworkUrl100: $artworkUrl100, collectionPrice: $collectionPrice, trackPrice: $trackPrice, releaseDate: $releaseDate, collectionExplicitness: $collectionExplicitness, trackExplicitness: $trackExplicitness, discCount: $discCount, discNumber: $discNumber, trackCount: $trackCount, trackNumber: $trackNumber, trackTimeMillis: $trackTimeMillis, country: $country, currency: $currency, primaryGenreName: $primaryGenreName, isStreamable: $isStreamable, collectionArtistName: $collectionArtistName, collectionArtistId: $collectionArtistId, collectionArtistViewUrl: $collectionArtistViewUrl, contentAdvisoryRating: $contentAdvisoryRating, trackRentalPrice: $trackRentalPrice, collectionHdPrice: $collectionHdPrice, trackHdPrice: $trackHdPrice, trackHdRentalPrice: $trackHdRentalPrice, shortDescription: $shortDescription, longDescription: $longDescription, hasITunesExtras: $hasITunesExtras, copyright: $copyright, description: $description, feedUrl: $feedUrl, artworkUrl600: $artworkUrl600, genreIds: $genreIds, genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItunesSearchResultImpl &&
            (identical(other.wrapperType, wrapperType) ||
                other.wrapperType == wrapperType) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.artistId, artistId) ||
                other.artistId == artistId) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.trackId, trackId) || other.trackId == trackId) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            (identical(other.trackName, trackName) ||
                other.trackName == trackName) &&
            (identical(other.collectionCensoredName, collectionCensoredName) ||
                other.collectionCensoredName == collectionCensoredName) &&
            (identical(other.trackCensoredName, trackCensoredName) ||
                other.trackCensoredName == trackCensoredName) &&
            (identical(other.artistViewUrl, artistViewUrl) ||
                other.artistViewUrl == artistViewUrl) &&
            (identical(other.collectionViewUrl, collectionViewUrl) ||
                other.collectionViewUrl == collectionViewUrl) &&
            (identical(other.trackViewUrl, trackViewUrl) ||
                other.trackViewUrl == trackViewUrl) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl) &&
            (identical(other.artworkUrl30, artworkUrl30) ||
                other.artworkUrl30 == artworkUrl30) &&
            (identical(other.artworkUrl60, artworkUrl60) ||
                other.artworkUrl60 == artworkUrl60) &&
            (identical(other.artworkUrl100, artworkUrl100) ||
                other.artworkUrl100 == artworkUrl100) &&
            (identical(other.collectionPrice, collectionPrice) ||
                other.collectionPrice == collectionPrice) &&
            (identical(other.trackPrice, trackPrice) ||
                other.trackPrice == trackPrice) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.collectionExplicitness, collectionExplicitness) ||
                other.collectionExplicitness == collectionExplicitness) &&
            (identical(other.trackExplicitness, trackExplicitness) ||
                other.trackExplicitness == trackExplicitness) &&
            (identical(other.discCount, discCount) ||
                other.discCount == discCount) &&
            (identical(other.discNumber, discNumber) ||
                other.discNumber == discNumber) &&
            (identical(other.trackCount, trackCount) ||
                other.trackCount == trackCount) &&
            (identical(other.trackNumber, trackNumber) ||
                other.trackNumber == trackNumber) &&
            (identical(other.trackTimeMillis, trackTimeMillis) ||
                other.trackTimeMillis == trackTimeMillis) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.primaryGenreName, primaryGenreName) ||
                other.primaryGenreName == primaryGenreName) &&
            (identical(other.isStreamable, isStreamable) ||
                other.isStreamable == isStreamable) &&
            (identical(other.collectionArtistName, collectionArtistName) ||
                other.collectionArtistName == collectionArtistName) &&
            (identical(other.collectionArtistId, collectionArtistId) ||
                other.collectionArtistId == collectionArtistId) &&
            (identical(other.collectionArtistViewUrl, collectionArtistViewUrl) ||
                other.collectionArtistViewUrl == collectionArtistViewUrl) &&
            (identical(other.contentAdvisoryRating, contentAdvisoryRating) ||
                other.contentAdvisoryRating == contentAdvisoryRating) &&
            (identical(other.trackRentalPrice, trackRentalPrice) ||
                other.trackRentalPrice == trackRentalPrice) &&
            (identical(other.collectionHdPrice, collectionHdPrice) ||
                other.collectionHdPrice == collectionHdPrice) &&
            (identical(other.trackHdPrice, trackHdPrice) ||
                other.trackHdPrice == trackHdPrice) &&
            (identical(other.trackHdRentalPrice, trackHdRentalPrice) ||
                other.trackHdRentalPrice == trackHdRentalPrice) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.longDescription, longDescription) ||
                other.longDescription == longDescription) &&
            (identical(other.hasITunesExtras, hasITunesExtras) ||
                other.hasITunesExtras == hasITunesExtras) &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.feedUrl, feedUrl) || other.feedUrl == feedUrl) &&
            (identical(other.artworkUrl600, artworkUrl600) ||
                other.artworkUrl600 == artworkUrl600) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        wrapperType,
        kind,
        artistId,
        collectionId,
        trackId,
        artistName,
        collectionName,
        trackName,
        collectionCensoredName,
        trackCensoredName,
        artistViewUrl,
        collectionViewUrl,
        trackViewUrl,
        previewUrl,
        artworkUrl30,
        artworkUrl60,
        artworkUrl100,
        collectionPrice,
        trackPrice,
        releaseDate,
        collectionExplicitness,
        trackExplicitness,
        discCount,
        discNumber,
        trackCount,
        trackNumber,
        trackTimeMillis,
        country,
        currency,
        primaryGenreName,
        isStreamable,
        collectionArtistName,
        collectionArtistId,
        collectionArtistViewUrl,
        contentAdvisoryRating,
        trackRentalPrice,
        collectionHdPrice,
        trackHdPrice,
        trackHdRentalPrice,
        shortDescription,
        longDescription,
        hasITunesExtras,
        copyright,
        description,
        feedUrl,
        artworkUrl600,
        const DeepCollectionEquality().hash(_genreIds),
        const DeepCollectionEquality().hash(_genres)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItunesSearchResultImplCopyWith<_$ItunesSearchResultImpl> get copyWith =>
      __$$ItunesSearchResultImplCopyWithImpl<_$ItunesSearchResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItunesSearchResultImplToJson(
      this,
    );
  }
}

abstract class _ItunesSearchResult implements ItunesSearchResult {
  const factory _ItunesSearchResult(
      {@JsonKey(name: "wrapperType") final String? wrapperType,
      @JsonKey(name: "kind") final String? kind,
      @JsonKey(name: "artistId") final int? artistId,
      @JsonKey(name: "collectionId") final int? collectionId,
      @JsonKey(name: "trackId") final int? trackId,
      @JsonKey(name: "artistName") final String? artistName,
      @JsonKey(name: "collectionName") final String? collectionName,
      @JsonKey(name: "trackName") final String? trackName,
      @JsonKey(name: "collectionCensoredName")
      final String? collectionCensoredName,
      @JsonKey(name: "trackCensoredName") final String? trackCensoredName,
      @JsonKey(name: "artistViewUrl") final String? artistViewUrl,
      @JsonKey(name: "collectionViewUrl") final String? collectionViewUrl,
      @JsonKey(name: "trackViewUrl") final String? trackViewUrl,
      @JsonKey(name: "previewUrl") final String? previewUrl,
      @JsonKey(name: "artworkUrl30") final String? artworkUrl30,
      @JsonKey(name: "artworkUrl60") final String? artworkUrl60,
      @JsonKey(name: "artworkUrl100") final String? artworkUrl100,
      @JsonKey(name: "collectionPrice") final double? collectionPrice,
      @JsonKey(name: "trackPrice") final double? trackPrice,
      @JsonKey(name: "releaseDate") final String? releaseDate,
      @JsonKey(name: "collectionExplicitness")
      final String? collectionExplicitness,
      @JsonKey(name: "trackExplicitness") final String? trackExplicitness,
      @JsonKey(name: "discCount") final int? discCount,
      @JsonKey(name: "discNumber") final int? discNumber,
      @JsonKey(name: "trackCount") final int? trackCount,
      @JsonKey(name: "trackNumber") final int? trackNumber,
      @JsonKey(name: "trackTimeMillis") final int? trackTimeMillis,
      @JsonKey(name: "country") final String? country,
      @JsonKey(name: "currency") final String? currency,
      @JsonKey(name: "primaryGenreName") final String? primaryGenreName,
      @JsonKey(name: "isStreamable") final bool? isStreamable,
      @JsonKey(name: "collectionArtistName") final String? collectionArtistName,
      @JsonKey(name: "collectionArtistId") final int? collectionArtistId,
      @JsonKey(name: "collectionArtistViewUrl")
      final String? collectionArtistViewUrl,
      @JsonKey(name: "contentAdvisoryRating")
      final String? contentAdvisoryRating,
      @JsonKey(name: "trackRentalPrice") final double? trackRentalPrice,
      @JsonKey(name: "collectionHdPrice") final double? collectionHdPrice,
      @JsonKey(name: "trackHdPrice") final double? trackHdPrice,
      @JsonKey(name: "trackHdRentalPrice") final double? trackHdRentalPrice,
      @JsonKey(name: "shortDescription") final String? shortDescription,
      @JsonKey(name: "longDescription") final String? longDescription,
      @JsonKey(name: "hasITunesExtras") final bool? hasITunesExtras,
      @JsonKey(name: "copyright") final String? copyright,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "feedUrl") final String? feedUrl,
      @JsonKey(name: "artworkUrl600") final String? artworkUrl600,
      @JsonKey(name: "genreIds") final List<String>? genreIds,
      @JsonKey(name: "genres")
      final List<String>? genres}) = _$ItunesSearchResultImpl;

  factory _ItunesSearchResult.fromJson(Map<String, dynamic> json) =
      _$ItunesSearchResultImpl.fromJson;

  @override
  @JsonKey(name: "wrapperType")
  String? get wrapperType;
  @override
  @JsonKey(name: "kind")
  String? get kind;
  @override
  @JsonKey(name: "artistId")
  int? get artistId;
  @override
  @JsonKey(name: "collectionId")
  int? get collectionId;
  @override
  @JsonKey(name: "trackId")
  int? get trackId;
  @override
  @JsonKey(name: "artistName")
  String? get artistName;
  @override
  @JsonKey(name: "collectionName")
  String? get collectionName;
  @override
  @JsonKey(name: "trackName")
  String? get trackName;
  @override
  @JsonKey(name: "collectionCensoredName")
  String? get collectionCensoredName;
  @override
  @JsonKey(name: "trackCensoredName")
  String? get trackCensoredName;
  @override
  @JsonKey(name: "artistViewUrl")
  String? get artistViewUrl;
  @override
  @JsonKey(name: "collectionViewUrl")
  String? get collectionViewUrl;
  @override
  @JsonKey(name: "trackViewUrl")
  String? get trackViewUrl;
  @override
  @JsonKey(name: "previewUrl")
  String? get previewUrl;
  @override
  @JsonKey(name: "artworkUrl30")
  String? get artworkUrl30;
  @override
  @JsonKey(name: "artworkUrl60")
  String? get artworkUrl60;
  @override
  @JsonKey(name: "artworkUrl100")
  String? get artworkUrl100;
  @override
  @JsonKey(name: "collectionPrice")
  double? get collectionPrice;
  @override
  @JsonKey(name: "trackPrice")
  double? get trackPrice;
  @override
  @JsonKey(name: "releaseDate")
  String? get releaseDate;
  @override
  @JsonKey(name: "collectionExplicitness")
  String? get collectionExplicitness;
  @override
  @JsonKey(name: "trackExplicitness")
  String? get trackExplicitness;
  @override
  @JsonKey(name: "discCount")
  int? get discCount;
  @override
  @JsonKey(name: "discNumber")
  int? get discNumber;
  @override
  @JsonKey(name: "trackCount")
  int? get trackCount;
  @override
  @JsonKey(name: "trackNumber")
  int? get trackNumber;
  @override
  @JsonKey(name: "trackTimeMillis")
  int? get trackTimeMillis;
  @override
  @JsonKey(name: "country")
  String? get country;
  @override
  @JsonKey(name: "currency")
  String? get currency;
  @override
  @JsonKey(name: "primaryGenreName")
  String? get primaryGenreName;
  @override
  @JsonKey(name: "isStreamable")
  bool? get isStreamable;
  @override
  @JsonKey(name: "collectionArtistName")
  String? get collectionArtistName;
  @override
  @JsonKey(name: "collectionArtistId")
  int? get collectionArtistId;
  @override
  @JsonKey(name: "collectionArtistViewUrl")
  String? get collectionArtistViewUrl;
  @override
  @JsonKey(name: "contentAdvisoryRating")
  String? get contentAdvisoryRating;
  @override
  @JsonKey(name: "trackRentalPrice")
  double? get trackRentalPrice;
  @override
  @JsonKey(name: "collectionHdPrice")
  double? get collectionHdPrice;
  @override
  @JsonKey(name: "trackHdPrice")
  double? get trackHdPrice;
  @override
  @JsonKey(name: "trackHdRentalPrice")
  double? get trackHdRentalPrice;
  @override
  @JsonKey(name: "shortDescription")
  String? get shortDescription;
  @override
  @JsonKey(name: "longDescription")
  String? get longDescription;
  @override
  @JsonKey(name: "hasITunesExtras")
  bool? get hasITunesExtras;
  @override
  @JsonKey(name: "copyright")
  String? get copyright;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "feedUrl")
  String? get feedUrl;
  @override
  @JsonKey(name: "artworkUrl600")
  String? get artworkUrl600;
  @override
  @JsonKey(name: "genreIds")
  List<String>? get genreIds;
  @override
  @JsonKey(name: "genres")
  List<String>? get genres;
  @override
  @JsonKey(ignore: true)
  _$$ItunesSearchResultImplCopyWith<_$ItunesSearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
