import '../../../core/networking/api_constant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/networking/api_manger.dart';
import '../../../core/networking/api_network_exception.dart';
import 'itunes_search_dto.dart';
part 'search_repository.g.dart';

class SearchRepository {
  Future<ItunesSearchDto> fetchSearchResults(Map<String, dynamic>? query, IApiManager apiManager) async {
    try {
      final response = await apiManager.get(ApiConstant.search, queryParameters: query);
      return itunesSearchDtoFromJson(response as String);
    } on DioExceptions catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Failed to fetch search results: $e');
    }
  }
}

@riverpod
SearchRepository searchRepository(SearchRepositoryRef ref) {
  return SearchRepository();
}
