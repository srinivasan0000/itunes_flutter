import 'package:assessment_itunes/src/core/extensions/material_extensions.dart';
import 'package:assessment_itunes/src/features/home/presentation/description_movie_page.dart';
import 'package:assessment_itunes/src/services/app_theme_provider.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../route_management/router.dart';
import '../../common_widgets/network_aware_widget.dart';
import '../data/itunes_search_dto.dart';
import 'description_song_page.dart';
import 'states/query_state.dart';
import 'states/search_state.dart';
import 'widgets/search_field_widget.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchStateProvider);
    ref.listen(
      queryParamProvider,
      (previous, next) {
        ref.read(searchStateProvider.notifier).search(next);
      },
    );

    return NetworkAwareWidget(
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: context.colorTheme.surface,
              automaticallyImplyLeading: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(90),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 3, top: 5.0, bottom: 5),
                      child: Row(
                        children: [
                          IconButton(
                            visualDensity: VisualDensity.compact,
                            icon: Icon(
                              Icons.arrow_back,
                              color: context.colorTheme.onSurface,
                              size: 30,
                            ),
                            onPressed: () => context.pop(),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const SearchFieldWidget(isHome: false),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.filter_list,
                              color: context.colorTheme.onSurface,
                            ),
                            onPressed: () => context.pushNamed(Routes.filter.name),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 13),
                      decoration: BoxDecoration(
                        color: ref.watch(appThemeProvider) == AppThemeMode.dark ? Colors.grey[850] : Colors.grey[100],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: context.colorTheme.primaryContainer,
                          borderRadius: BorderRadius.circular(25),
                          shape: BoxShape.rectangle,
                        ),
                        indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: context.colorTheme.onSurface,
                        unselectedLabelColor: Colors.grey[600],
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        tabs: const [
                          Tab(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.list, size: 24),
                                SizedBox(width: 8),
                                Text('List'),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.grid_view, size: 24),
                                SizedBox(width: 8),
                                Text('Grid'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: searchState.when(
              data: (data) => TabBarView(
                children: [
                  _buildListResults(results: data),
                  _buildGridResults(results: data),
                ],
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('${error.toString()}!')),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListResults({required List<ItunesSearchResult> results}) {
    if (results.isEmpty) {
      return _buildEmptyState();
    }

    List<String> uniqueKind = results.map((e) => e.kind).where((kind) => kind != null).cast<String>().toSet().toList();
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 30),
      itemCount: uniqueKind.length,
      itemBuilder: (context, index) {
        final kind = uniqueKind[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _formatKindTitle(kind),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _getColorForKind(kind),
                      ),
                )),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: results.where((element) => element.kind == uniqueKind[index]).length,
              itemBuilder: (context, i) {
                final result = results.where((element) => element.kind == uniqueKind[index]).toList()[i];
                return _buildListItem(result);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildListItem(ItunesSearchResult result) {
    switch (result.kind) {
      case 'feature-movie':
        return _buildMovieListItem(result);
      case 'song':
        return _buildSongListItem(result);
      case 'tv-episode':
        return _buildTVEpisodeListItem(result);
      case 'podcast':
        return _buildPodcastListItem(result);
      case 'ebook':
        return _buildEbookListItem(result);
      case 'audiobook':
        return _buildAudiobookListItem(result);
      default:
        return _buildDefaultListItem(result);
    }
  }

  Widget _buildMovieListItem(ItunesSearchResult result) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => MovieDescriptionPage(result: result))),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(result.artworkUrl100?.replaceAll('100x100bb', '300x300bb') ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    result.trackName ?? 'Unknown Movie',
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Director: ${result.artistName ?? 'Unknown'}',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Chip(
                label: const Text('Movie'),
                backgroundColor: Colors.red.withOpacity(0.8),
                labelStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSongListItem(ItunesSearchResult result) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute<void>(builder: (context) => SongDescriptionPage(result: result)));
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.purple.shade300, Colors.blue.shade300],
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
                child: Image.network(
                  result.artworkUrl100 ?? '',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        result.trackName ?? 'Unknown Song',
                        style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 17, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        result.artistName ?? 'Unknown Artist',
                        style: const TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.w700),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        result.collectionName ?? 'Unknown Album',
                        style: const TextStyle(color: Colors.white60, fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Song',
                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTVEpisodeListItem(ItunesSearchResult result) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.teal.shade100,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
              child: Image.network(
                result.artworkUrl100 ?? '',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      result.trackName ?? 'Unknown Episode',
                      style: TextStyle(color: Colors.teal.shade800, fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      result.collectionName ?? 'Unknown Show',
                      style: TextStyle(color: Colors.teal.shade600, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Season ${result.discNumber ?? 'Unknown'}',
                      style: TextStyle(color: Colors.teal.shade500, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'TV',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildPodcastListItem(ItunesSearchResult result) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.orange.shade50,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
              child: Image.network(
                result.artworkUrl100 ?? '',
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      result.collectionName ?? 'Unknown Podcast',
                      style: TextStyle(color: Colors.orange.shade800, fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Host: ${result.artistName ?? 'Unknown'}',
                      style: TextStyle(color: Colors.orange.shade600, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Podcast',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildAudiobookListItem(ItunesSearchResult result) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple.shade300, Colors.deepPurple.shade700],
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
              child: Image.network(
                result.artworkUrl100 ?? '',
                width: 120,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      result.collectionName ?? 'Unknown Audiobook',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(color: Colors.black26, blurRadius: 2, offset: Offset(1, 1))],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.white70, size: 16),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'Author: ${result.artistName ?? 'Unknown'}',
                            style: const TextStyle(color: Colors.white70, fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.record_voice_over, color: Colors.white60, size: 16),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'Narrator: ${result.collectionArtistName ?? 'Unknown'}',
                            style: const TextStyle(color: Colors.white60, fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.headphones, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Audiobook',
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEbookListItem(ItunesSearchResult result) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.indigo.shade50,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
              child: Image.network(
                result.artworkUrl100 ?? '',
                width: 110,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      result.trackName ?? 'Unknown Book',
                      style: TextStyle(color: Colors.indigo.shade800, fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Author: ${result.artistName ?? 'Unknown'}',
                      style: TextStyle(color: Colors.indigo.shade600, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Ebook',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultListItem(ItunesSearchResult result) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
              child: Image.network(
                result.artworkUrl100 ?? '',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      result.trackName ?? result.collectionName ?? result.artistName ?? 'Unknown',
                      style: TextStyle(color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      result.artistName ?? 'Unknown',
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                result.kind ?? 'Unknown',
                style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildGridResults({required List<ItunesSearchResult> results}) {
    if (results.isEmpty) {
      return _buildEmptyState();
    }

    List<String> uniqueKinds = results.map((e) => e.kind).where((kind) => kind != null).cast<String>().toSet().toList();

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 30),
      itemCount: uniqueKinds.length,
      itemBuilder: (context, index) {
        final kind = uniqueKinds[index];
        final kindResults = results.where((element) => element.kind == kind).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _formatKindTitle(kind),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _getColorForKind(kind),
                    ),
              ),
            ),
            SizedBox(
              height: 200,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                ),
                itemCount: kindResults.length,
                itemBuilder: (context, index) {
                  return _buildGridItem(kindResults[index]);
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  Widget _buildGridItem(ItunesSearchResult result) {
    Color baseColor = _getColorForKind(result.kind);
    IconData iconData = _getIconForKind(result.kind);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [baseColor.withOpacity(0.7), baseColor.withOpacity(0.9)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  if (result.kind == 'feature-movie') {
                    Navigator.push(context, MaterialPageRoute<void>(builder: (context) => MovieDescriptionPage(result: result)));
                  } else if (result.kind == 'song') {
                    Navigator.push(context, MaterialPageRoute<void>(builder: (context) => SongDescriptionPage(result: result)));
                  }
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        result.artworkUrl100 ?? '',
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, baseColor.withOpacity(0.5)],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Icon(iconData, color: Colors.white, size: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      result.trackName ?? result.collectionName ?? result.artistName ?? 'Unknown',
                      style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      result.artistName ?? 'Unknown',
                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorForKind(String? kind) {
    switch (kind) {
      case 'feature-movie':
        return Colors.red;
      case 'song':
        return Colors.purple;
      case 'tv-episode':
        return Colors.teal;
      case 'podcast':
        return Colors.orange;
      case 'ebook':
        return Colors.indigo;
      case 'audiobook':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getIconForKind(String? kind) {
    switch (kind) {
      case 'feature-movie':
        return Icons.movie;
      case 'song':
        return Icons.music_note;
      case 'tv-episode':
        return Icons.tv;
      case 'podcast':
        return Icons.mic;
      case 'ebook':
        return Icons.book;
      case 'audiobook':
        return Icons.headphones;
      default:
        return Icons.question_mark;
    }
  }

  Widget _buildEmptyState() {
    final searchTerm = ref.watch(queryParamProvider)['term'];
    if (searchTerm == null || searchTerm.toString().isEmpty) {
      return const Center(child: Text('Search to get results'));
    } else {
      return const Center(child: Text('No content found'));
    }
  }

  String _formatKindTitle(String? kind) {
    if (kind == null) return 'Unknown';
    return kind.split('-').map((word) => word.capitalize()).join(' ');
  }
}
