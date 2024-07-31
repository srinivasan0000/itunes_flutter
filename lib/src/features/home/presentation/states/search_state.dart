
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/itunes_search_dto.dart';
import '../../data/search_repository.dart';

import '../../../../core/networking/api_debounce.dart';
import '../../../../core/networking/api_manger.dart';

part 'search_state.g.dart';

@Riverpod(keepAlive: false)
class SearchState extends _$SearchState {
  late final Debouncer _debouncer;

  SearchState() : super() {
    _debouncer = Debouncer(delay: const Duration(milliseconds: 500));
  }

  @override
  FutureOr<List<ItunesSearchResult>> build() {
    return [];
  }

  Future<void> search(Map<String, dynamic> queryParams) async {
    if (queryParams['term'] == null || queryParams['term'].toString().isEmpty) {
      state = const AsyncData([]);
      return;
    }
    _debouncer.call(() async {
      state = const AsyncLoading();
      state = await AsyncValue.guard(() async {
        try {
          final res = await ref.read(searchRepositoryProvider).fetchSearchResults(
                queryParams,
                ref.read(apiManagerProvider),
              );
          return res.results ?? [];
        } catch (e) {
          if (e is Exception && e.toString().contains('The requested resource was not found')) {
            return [];
          }
          rethrow;
        }
      });
    });
  }

  void clearSearch() {
    state = const AsyncData([]);
  }
}
