import 'package:assessment_itunes/src/core/networking/api_manger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assessment_itunes/src/features/home/presentation/states/search_state.dart';
import 'package:assessment_itunes/src/features/home/data/search_repository.dart';
import 'package:assessment_itunes/src/features/home/data/itunes_search_dto.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

class MockApiManager extends Mock implements IApiManager {}

void main() {
  late ProviderContainer container;
  late MockSearchRepository mockSearchRepository;
  late MockApiManager mockApiManager;

  setUp(() {
    mockSearchRepository = MockSearchRepository();
    mockApiManager = MockApiManager();
    container = ProviderContainer(
      overrides: [
        searchRepositoryProvider.overrideWithValue(mockSearchRepository),
        apiManagerProvider.overrideWithValue(mockApiManager),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state is empty list', () async {
    final searchState = container.read(searchStateProvider);
    expect(searchState, isA<AsyncData<List<ItunesSearchResult>>>());
    expect(searchState.value, isEmpty);
  });

  test('search with empty term returns empty list', () async {
    final searchStateNotifier = container.read(searchStateProvider.notifier);
    await searchStateNotifier.search({'term': ''});
    final searchState = container.read(searchStateProvider);
    expect(searchState, isA<AsyncData<List<ItunesSearchResult>>>());
    expect(searchState.value, isEmpty);
  });

  test('search with valid term returns results', () async {
    final searchResults = [
      const ItunesSearchResult(wrapperType: 'track', kind: 'song', artistId: 1),
    ];
    when(() => mockSearchRepository.fetchSearchResults(any(), any())).thenAnswer((_) async => ItunesSearchDto(resultCount: 1, results: searchResults));

    final searchStateNotifier = container.read(searchStateProvider.notifier);
    await searchStateNotifier.search({'term': 'test'});
    final searchState = container.read(searchStateProvider);
    expect(searchState, isA<AsyncData<List<ItunesSearchResult>>>());
    expect(searchState.value, searchResults);
  });

  test('search with error returns AsyncError', () async {
    when(() => mockSearchRepository.fetchSearchResults(any(), any())).thenThrow(Exception('Network error'));

    final searchStateNotifier = container.read(searchStateProvider.notifier);
    await searchStateNotifier.search({'term': 'test'});
    final searchState = container.read(searchStateProvider);
    expect(searchState, isA<AsyncError<List<ItunesSearchResult>>>());
  });
}
