

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_state.g.dart';

enum MediaTypeQuery { movie, podcast, music, musicVideo, audiobook, shortFilm, tvShow, software, ebook, all }

enum CountryQuery { US, IN, UK, GB, FR }

enum LanguageQuery { english, tamil, hindi, french }

@Riverpod(keepAlive: true)
class QueryParam extends _$QueryParam {
  @override
  Map<String, dynamic> build() {
    return {
      'country': CountryQuery.US.name,
      'media': MediaTypeQuery.all.name,
      // 'lang': LanguageQuery.english.name,
    };
  }

  void setTerm(String term) {
    if (term.isNotEmpty) {
      state = {...state, 'term': term};
    } else {
      state = {...state}..remove('term');
    }
  }

  void setCountry(CountryQuery country) {
    state = {...state, 'country': country.name};
  }

  void setMedia(MediaTypeQuery media) {
    state = {...state, 'media': media.name};
  }

  void clearTerm() {
    state = {...state}..remove('term');
  }
  // void setLanguage(LanguageQuery language) {
  //   state = {...state, 'lang': language.name};
  // }
}
