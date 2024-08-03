// ignore_for_file: inference_failure_on_untyped_parameter

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import '../data/itunes_search_dto.dart';

class MovieDescriptionPage extends StatefulWidget {
  const MovieDescriptionPage({super.key, required this.result});

  final ItunesSearchResult result;

  @override
  State<MovieDescriptionPage> createState() => _MovieDescriptionPageState();
}

class _MovieDescriptionPageState extends State<MovieDescriptionPage> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    if (widget.result.previewUrl != null) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.result.previewUrl!))
        ..initialize().then((_) {
          setState(() {
            _isVideoInitialized = true;
          });
        }).catchError((error) {
          debugPrint("Error initializing video player: $error");
          setState(() {
            _isVideoInitialized = false;
          });
        });
    } else {
      setState(() {
        _isVideoInitialized = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildVideoPlayer(),
                _buildMovieInfo(context),
                _buildDescription(context),
                _buildAdditionalInfo(context),
                _buildActionButtons(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              widget.result.artworkUrl100?.replaceAll('100x100bb', '600x600bb') ?? '',
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
            ),
          ],
        ),
        title: Text(widget.result.trackName ?? 'Unknown Movie', style: const TextStyle(color: Colors.white54)),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  Widget _buildVideoPlayer() {
    if (!_isVideoInitialized) {
      return const SizedBox.shrink();
    }
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          VideoPlayer(_controller),
          _VideoProgressIndicator(_controller),
          _PlayPauseOverlay(controller: _controller),
        ],
      ),
    );
  }

  Widget _buildMovieInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.result.trackName ?? 'Unknown Movie',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            widget.result.artistName ?? 'Unknown Director',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildInfoChip(context, widget.result.primaryGenreName ?? 'Unknown Genre'),
              const SizedBox(width: 8),
              _buildInfoChip(context, widget.result.contentAdvisoryRating ?? 'Not Rated'),
              const SizedBox(width: 8),
              _buildInfoChip(context, _formatDuration(widget.result.trackTimeMillis)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Text(
            widget.result.longDescription ?? widget.result.shortDescription ?? 'No description available.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(context, 'Release Date', _formatDate(widget.result.releaseDate)),
          _buildInfoRow(context, 'Collection', widget.result.collectionName ?? 'N/A'),
          _buildInfoRow(context, 'Price', '\$${widget.result.trackPrice ?? 'N/A'}'),
          _buildInfoRow(context, 'Rental Price', '\$${widget.result.trackRentalPrice ?? 'N/A'}'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.titleMedium),
          Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // use later
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Buy'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Use later
                  },
                  icon: const Icon(Icons.video_library),
                  label: const Text('Rent'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ValueListenableBuilder(
            valueListenable: _controller,
            builder: (context, VideoPlayerValue value, child) {
              return ElevatedButton.icon(
                onPressed: _isVideoInitialized
                    ? () {
                        setState(() {
                          value.isPlaying ? _controller.pause() : _controller.play();
                        });
                      }
                    : null,
                icon: Icon(value.isPlaying ? Icons.pause : Icons.play_arrow),
                label: Text(value.isPlaying ? 'Pause Trailer' : 'Play Trailer'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  minimumSize: const Size(double.infinity, 0),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _formatDuration(int? milliseconds) {
    if (milliseconds == null) return 'Unknown';
    final duration = Duration(milliseconds: milliseconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }

  String _formatDate(String? dateString) {
    if (dateString == null) return 'Unknown';
    final date = DateTime.parse(dateString);
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

class _VideoProgressIndicator extends StatelessWidget {
  final VideoPlayerController controller;

  const _VideoProgressIndicator(this.controller);

  @override
  Widget build(BuildContext context) {
    return VideoProgressIndicator(
      controller,
      allowScrubbing: true,
      colors: VideoProgressColors(
        playedColor: Theme.of(context).colorScheme.secondary,
        bufferedColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        backgroundColor: Colors.grey,
      ),
    );
  }
}

class _PlayPauseOverlay extends StatefulWidget {
  final VideoPlayerController controller;

  const _PlayPauseOverlay({required this.controller});

  @override
  _PlayPauseOverlayState createState() => _PlayPauseOverlayState();
}

class _PlayPauseOverlayState extends State<_PlayPauseOverlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: widget.controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.controller.value.isPlaying ? widget.controller.pause() : widget.controller.play();
            });
          },
        ),
      ],
    );
  }
}
