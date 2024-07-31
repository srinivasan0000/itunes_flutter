
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'itunes_search_dto.freezed.dart';
part 'itunes_search_dto.g.dart';

ItunesSearchDto itunesSearchDtoFromJson(String str) => ItunesSearchDto.fromJson(json.decode(str) as Map<String, dynamic>);

String itunesSearchDtoToJson(ItunesSearchDto data) => json.encode(data.toJson());

@freezed
class ItunesSearchDto with _$ItunesSearchDto {
    const factory ItunesSearchDto({
        @JsonKey(name: "resultCount")
        int? resultCount,
        @JsonKey(name: "results")
        List<ItunesSearchResult>? results,
    }) = _ItunesSearchDto;

    factory ItunesSearchDto.fromJson(Map<String, dynamic> json) => _$ItunesSearchDtoFromJson(json);
}

@freezed
class ItunesSearchResult with _$ItunesSearchResult {
    const factory ItunesSearchResult({
        @JsonKey(name: "wrapperType")
        String? wrapperType,
        @JsonKey(name: "kind")
        String? kind,
        @JsonKey(name: "artistId")
        int? artistId,
        @JsonKey(name: "collectionId")
        int? collectionId,
        @JsonKey(name: "trackId")
        int? trackId,
        @JsonKey(name: "artistName")
        String? artistName,
        @JsonKey(name: "collectionName")
        String? collectionName,
        @JsonKey(name: "trackName")
        String? trackName,
        @JsonKey(name: "collectionCensoredName")
        String? collectionCensoredName,
        @JsonKey(name: "trackCensoredName")
        String? trackCensoredName,
        @JsonKey(name: "artistViewUrl")
        String? artistViewUrl,
        @JsonKey(name: "collectionViewUrl")
        String? collectionViewUrl,
        @JsonKey(name: "trackViewUrl")
        String? trackViewUrl,
        @JsonKey(name: "previewUrl")
        String? previewUrl,
        @JsonKey(name: "artworkUrl30")
        String? artworkUrl30,
        @JsonKey(name: "artworkUrl60")
        String? artworkUrl60,
        @JsonKey(name: "artworkUrl100")
        String? artworkUrl100,
        @JsonKey(name: "collectionPrice")
        double? collectionPrice,
        @JsonKey(name: "trackPrice")
        double? trackPrice,
        @JsonKey(name: "releaseDate")
        String? releaseDate,
        @JsonKey(name: "collectionExplicitness")
        String? collectionExplicitness,
        @JsonKey(name: "trackExplicitness")
        String? trackExplicitness,
        @JsonKey(name: "discCount")
        int? discCount,
        @JsonKey(name: "discNumber")
        int? discNumber,
        @JsonKey(name: "trackCount")
        int? trackCount,
        @JsonKey(name: "trackNumber")
        int? trackNumber,
        @JsonKey(name: "trackTimeMillis")
        int? trackTimeMillis,
        @JsonKey(name: "country")
        String? country,
        @JsonKey(name: "currency")
        String? currency,
        @JsonKey(name: "primaryGenreName")
        String? primaryGenreName,
        @JsonKey(name: "isStreamable")
        bool? isStreamable,
        @JsonKey(name: "collectionArtistName")
        String? collectionArtistName,
        @JsonKey(name: "collectionArtistId")
        int? collectionArtistId,
        @JsonKey(name: "collectionArtistViewUrl")
        String? collectionArtistViewUrl,
        @JsonKey(name: "contentAdvisoryRating")
        String? contentAdvisoryRating,
        @JsonKey(name: "trackRentalPrice")
        double? trackRentalPrice,
        @JsonKey(name: "collectionHdPrice")
        double? collectionHdPrice,
        @JsonKey(name: "trackHdPrice")
        double? trackHdPrice,
        @JsonKey(name: "trackHdRentalPrice")
        double? trackHdRentalPrice,
        @JsonKey(name: "shortDescription")
        String? shortDescription,
        @JsonKey(name: "longDescription")
        String? longDescription,
        @JsonKey(name: "hasITunesExtras")
        bool? hasITunesExtras,
        @JsonKey(name: "copyright")
        String? copyright,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "feedUrl")
        String? feedUrl,
        @JsonKey(name: "artworkUrl600")
        String? artworkUrl600,
        @JsonKey(name: "genreIds")
        List<String>? genreIds,
        @JsonKey(name: "genres")
        List<String>? genres,
    }) = _ItunesSearchResult;

    factory ItunesSearchResult.fromJson(Map<String, dynamic> json) => _$ItunesSearchResultFromJson(json);
}
