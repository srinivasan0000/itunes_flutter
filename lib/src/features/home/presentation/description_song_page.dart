import 'package:assessment_itunes/src/core/extensions/material_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/itunes_search_dto.dart';

class SongDescriptionPage extends StatelessWidget {
  const SongDescriptionPage({super.key, required this.result});

  final ItunesSearchResult result;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: context.colorTheme.surface,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              floating: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      result.artworkUrl100
                              ?.replaceAll('100x100bb', '600x600bb') ??
                          '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                              child: Icon(Icons.broken_image,
                                  size: 100, color: Colors.white54)),
                    ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black54],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        result.trackName ?? 'Unknown Track',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: context.colorTheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        result.artistName ?? 'Unknown Artist',
                        style: TextStyle(
                          fontSize: 18,
                          color: context.colorTheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildInfoRow(context, Icons.album, 'Album',
                          result.collectionName ?? 'Unknown'),
                      _buildInfoRow(context, Icons.calendar_today, 'Released',
                          _formatDate(result.releaseDate)),
                      _buildInfoRow(context, Icons.music_note, 'Genre',
                          result.primaryGenreName ?? 'Unknown'),
                      _buildInfoRow(context, Icons.timer, 'Duration',
                          _formatDuration(result.trackTimeMillis)),
                      const SizedBox(height: 32),
                      _buildPlayerControls(context),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: context.colorTheme.onSurface),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                      color: context.colorTheme.onSurface, fontSize: 14),
                ),
                Text(
                  value,
                  style: TextStyle(
                      color: context.colorTheme.onSurface, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.skip_previous,
              color: context.colorTheme.onSurface, size: 36),
          onPressed: () {},
        ),
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: IconButton(
            icon: Icon(Icons.play_arrow,
                color: context.colorTheme.onSurface, size: 48),
            onPressed: () {
              // Use later
            },
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: Icon(Icons.skip_next,
              color: context.colorTheme.onSurface, size: 36),
          onPressed: () {},
        ),
      ],
    );
  }

  String _formatDate(String? dateString) {
    if (dateString == null) return 'Unknown';
    final date = DateTime.parse(dateString);
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String _formatDuration(int? milliseconds) {
    if (milliseconds == null) return 'Unknown';
    final duration = Duration(milliseconds: milliseconds);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
