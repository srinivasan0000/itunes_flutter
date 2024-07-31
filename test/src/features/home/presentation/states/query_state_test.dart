import 'package:flutter_test/flutter_test.dart';
import 'package:assessment_itunes/src/features/home/presentation/states/query_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('QueryParam', () {
    late ProviderContainer container;
    late QueryParam queryParam;

    setUp(() {
      container = ProviderContainer();
      queryParam = container.read(queryParamProvider.notifier);
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is correct', () {
      expect(container.read(queryParamProvider), {
        'country': CountryQuery.US.name,
        'media': MediaTypeQuery.all.name,
      });
    });

    test('setTerm updates the term in the state', () {
      queryParam.setTerm('test');
      expect(container.read(queryParamProvider)['term'], 'test');
    });

    test('setTerm removes the term if it is empty', () {
      queryParam.setTerm('test');
      queryParam.setTerm('');
      expect(container.read(queryParamProvider).containsKey('term'), false);
    });

    test('setCountry updates the country in the state', () {
      queryParam.setCountry(CountryQuery.IN);
      expect(container.read(queryParamProvider)['country'], CountryQuery.IN.name);
    });

    test('setMedia updates the media in the state', () {
      queryParam.setMedia(MediaTypeQuery.movie);
      expect(container.read(queryParamProvider)['media'], MediaTypeQuery.movie.name);
    });

    test('clearTerm removes the term from the state', () {
      queryParam.setTerm('test');
      queryParam.clearTerm();
      expect(container.read(queryParamProvider).containsKey('term'), false);
    });
  });
}