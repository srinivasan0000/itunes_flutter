import 'package:assessment_itunes/src/core/extensions/material_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import '../data/itunes_search_dto.dart';

class SongDescriptionPage extends StatefulWidget {
  const SongDescriptionPage({super.key, required this.result});

  final ItunesSearchResult result;

  @override
  State<SongDescriptionPage> createState() => _SongDescriptionPageState();
}

class _SongDescriptionPageState extends State<SongDescriptionPage> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    if (widget.result.previewUrl != null) {
      await _audioPlayer.setUrl(widget.result.previewUrl!);
      _audioPlayer.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          setState(() {
            _isPlaying = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlay() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

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
                      widget.result.artworkUrl100
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
                        widget.result.trackName ?? 'Unknown Track',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: context.colorTheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.result.artistName ?? 'Unknown Artist',
                        style: TextStyle(
                          fontSize: 18,
                          color: context.colorTheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildInfoRow(context, Icons.album, 'Album',
                          widget.result.collectionName ?? 'Unknown'),
                      _buildInfoRow(context, Icons.calendar_today, 'Released',
                          _formatDate(widget.result.releaseDate)),
                      _buildInfoRow(context, Icons.music_note, 'Genre',
                          widget.result.primaryGenreName ?? 'Unknown'),
                      _buildInfoRow(context, Icons.timer, 'Duration',
                          _formatDuration(widget.result.trackTimeMillis)),
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
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              color: context.colorTheme.onSurface,
              size: 48,
            ),
            onPressed: widget.result.previewUrl != null ? _togglePlay : null,
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