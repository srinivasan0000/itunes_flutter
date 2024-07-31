import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/itunes_search_dto.dart';

class MovieDescriptionPage extends StatelessWidget {
  const MovieDescriptionPage({super.key, required this.result});

  final ItunesSearchResult result;

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
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              result.artworkUrl100?.replaceAll('100x100bb', '600x600bb') ?? '',
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
        title: Text(result.trackName ?? 'Unknown Movie'),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  Widget _buildMovieInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            result.trackName ?? 'Unknown Movie',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            result.artistName ?? 'Unknown Director',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildInfoChip(context, result.primaryGenreName ?? 'Unknown Genre'),
              const SizedBox(width: 8),
              _buildInfoChip(context, result.contentAdvisoryRating ?? 'Not Rated'),
              const SizedBox(width: 8),
              _buildInfoChip(context, _formatDuration(result.trackTimeMillis)),
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
            result.longDescription ?? result.shortDescription ?? 'No description available.',
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
          _buildInfoRow(context, 'Release Date', _formatDate(result.releaseDate)),
          _buildInfoRow(context, 'Collection', result.collectionName ?? 'N/A'),
          _buildInfoRow(context, 'Price', '\$${result.trackPrice ?? 'N/A'}'),
          _buildInfoRow(context, 'Rental Price', '\$${result.trackRentalPrice ?? 'N/A'}'),
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
      child: Row(
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
