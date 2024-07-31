// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itunes_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItunesSearchDtoImpl _$$ItunesSearchDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ItunesSearchDtoImpl(
      resultCount: (json['resultCount'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ItunesSearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ItunesSearchDtoImplToJson(
        _$ItunesSearchDtoImpl instance) =>
    <String, dynamic>{
      'resultCount': instance.resultCount,
      'results': instance.results,
    };

_$ItunesSearchResultImpl _$$ItunesSearchResultImplFromJson(
        Map<String, dynamic> json) =>
    _$ItunesSearchResultImpl(
      wrapperType: json['wrapperType'] as String?,
      kind: json['kind'] as String?,
      artistId: (json['artistId'] as num?)?.toInt(),
      collectionId: (json['collectionId'] as num?)?.toInt(),
      trackId: (json['trackId'] as num?)?.toInt(),
      artistName: json['artistName'] as String?,
      collectionName: json['collectionName'] as String?,
      trackName: json['trackName'] as String?,
      collectionCensoredName: json['collectionCensoredName'] as String?,
      trackCensoredName: json['trackCensoredName'] as String?,
      artistViewUrl: json['artistViewUrl'] as String?,
      collectionViewUrl: json['collectionViewUrl'] as String?,
      trackViewUrl: json['trackViewUrl'] as String?,
      previewUrl: json['previewUrl'] as String?,
      artworkUrl30: json['artworkUrl30'] as String?,
      artworkUrl60: json['artworkUrl60'] as String?,
      artworkUrl100: json['artworkUrl100'] as String?,
      collectionPrice: (json['collectionPrice'] as num?)?.toDouble(),
      trackPrice: (json['trackPrice'] as num?)?.toDouble(),
      releaseDate: json['releaseDate'] as String?,
      collectionExplicitness: json['collectionExplicitness'] as String?,
      trackExplicitness: json['trackExplicitness'] as String?,
      discCount: (json['discCount'] as num?)?.toInt(),
      discNumber: (json['discNumber'] as num?)?.toInt(),
      trackCount: (json['trackCount'] as num?)?.toInt(),
      trackNumber: (json['trackNumber'] as num?)?.toInt(),
      trackTimeMillis: (json['trackTimeMillis'] as num?)?.toInt(),
      country: json['country'] as String?,
      currency: json['currency'] as String?,
      primaryGenreName: json['primaryGenreName'] as String?,
      isStreamable: json['isStreamable'] as bool?,
      collectionArtistName: json['collectionArtistName'] as String?,
      collectionArtistId: (json['collectionArtistId'] as num?)?.toInt(),
      collectionArtistViewUrl: json['collectionArtistViewUrl'] as String?,
      contentAdvisoryRating: json['contentAdvisoryRating'] as String?,
      trackRentalPrice: (json['trackRentalPrice'] as num?)?.toDouble(),
      collectionHdPrice: (json['collectionHdPrice'] as num?)?.toDouble(),
      trackHdPrice: (json['trackHdPrice'] as num?)?.toDouble(),
      trackHdRentalPrice: (json['trackHdRentalPrice'] as num?)?.toDouble(),
      shortDescription: json['shortDescription'] as String?,
      longDescription: json['longDescription'] as String?,
      hasITunesExtras: json['hasITunesExtras'] as bool?,
      copyright: json['copyright'] as String?,
      description: json['description'] as String?,
      feedUrl: json['feedUrl'] as String?,
      artworkUrl600: json['artworkUrl600'] as String?,
      genreIds: (json['genreIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ItunesSearchResultImplToJson(
        _$ItunesSearchResultImpl instance) =>
    <String, dynamic>{
      'wrapperType': instance.wrapperType,
      'kind': instance.kind,
      'artistId': instance.artistId,
      'collectionId': instance.collectionId,
      'trackId': instance.trackId,
      'artistName': instance.artistName,
      'collectionName': instance.collectionName,
      'trackName': instance.trackName,
      'collectionCensoredName': instance.collectionCensoredName,
      'trackCensoredName': instance.trackCensoredName,
      'artistViewUrl': instance.artistViewUrl,
      'collectionViewUrl': instance.collectionViewUrl,
      'trackViewUrl': instance.trackViewUrl,
      'previewUrl': instance.previewUrl,
      'artworkUrl30': instance.artworkUrl30,
      'artworkUrl60': instance.artworkUrl60,
      'artworkUrl100': instance.artworkUrl100,
      'collectionPrice': instance.collectionPrice,
      'trackPrice': instance.trackPrice,
      'releaseDate': instance.releaseDate,
      'collectionExplicitness': instance.collectionExplicitness,
      'trackExplicitness': instance.trackExplicitness,
      'discCount': instance.discCount,
      'discNumber': instance.discNumber,
      'trackCount': instance.trackCount,
      'trackNumber': instance.trackNumber,
      'trackTimeMillis': instance.trackTimeMillis,
      'country': instance.country,
      'currency': instance.currency,
      'primaryGenreName': instance.primaryGenreName,
      'isStreamable': instance.isStreamable,
      'collectionArtistName': instance.collectionArtistName,
      'collectionArtistId': instance.collectionArtistId,
      'collectionArtistViewUrl': instance.collectionArtistViewUrl,
      'contentAdvisoryRating': instance.contentAdvisoryRating,
      'trackRentalPrice': instance.trackRentalPrice,
      'collectionHdPrice': instance.collectionHdPrice,
      'trackHdPrice': instance.trackHdPrice,
      'trackHdRentalPrice': instance.trackHdRentalPrice,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'hasITunesExtras': instance.hasITunesExtras,
      'copyright': instance.copyright,
      'description': instance.description,
      'feedUrl': instance.feedUrl,
      'artworkUrl600': instance.artworkUrl600,
      'genreIds': instance.genreIds,
      'genres': instance.genres,
    };
