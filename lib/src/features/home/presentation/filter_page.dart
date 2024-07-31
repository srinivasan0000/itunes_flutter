import 'package:assessment_itunes/src/core/extensions/material_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'states/query_state.dart';

enum FilterSegment { Media, Country }

class FilterPage extends ConsumerStatefulWidget {
  const FilterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FilterPageState();
}

class _FilterPageState extends ConsumerState<FilterPage> {
  FilterSegment _selectedSegment = FilterSegment.Media;

  @override
  Widget build(BuildContext context) {
    final queryParam = ref.watch(queryParamProvider);
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: _buildSideMenu(primaryColor),
          ),
          Expanded(
            flex: 2,
            child: _buildFilterOptions(queryParam, primaryColor),
          ),
        ],
      ),
    );
  }

  Widget _buildSideMenu(Color primaryColor) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorTheme.surfaceContainer,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: FilterSegment.values.map((segment) {
          return _buildSideMenuTile(segment, primaryColor);
        }).toList(),
      ),
    );
  }

  Widget _buildSideMenuTile(FilterSegment segment, Color primaryColor) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: _selectedSegment == segment ? context.colorTheme.primaryContainer : context.colorTheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Text(
          segment.name,
          style: TextStyle(
            color: _selectedSegment == segment ? context.colorTheme.onSurface : null,
            fontWeight: _selectedSegment == segment ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        selected: _selectedSegment == segment,
        onTap: () => setState(() => _selectedSegment = segment),
      ),
    );
  }

  Widget _buildFilterOptions(Map<String, dynamic> queryParam, Color primaryColor) {
    List<Widget> options;
    switch (_selectedSegment) {
      case FilterSegment.Media:
        options = MediaTypeQuery.values.map((media) {
          return _buildFilterTile(
            title: _capitalizeFirstLetter(media.name),
            isSelected: queryParam['media'] == media.name,
            onTap: () => ref.read(queryParamProvider.notifier).setMedia(media),
            primaryColor: primaryColor,
            icon: _getIconForMediaType(media),
          );
        }).toList();
        break;
      case FilterSegment.Country:
        options = CountryQuery.values.map((country) {
          return _buildFilterTile(
            title: country.name,
            isSelected: queryParam['country'] == country.name,
            onTap: () => ref.read(queryParamProvider.notifier).setCountry(country),
            primaryColor: primaryColor,
            icon: Icons.flag,
          );
        }).toList();
        break;
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: options.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) => options[index],
    );
  }

  Widget _buildFilterTile({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    required Color primaryColor,
    required IconData icon,
  }) {
    return ListTile(
      leading: Icon(icon, color: isSelected ? context.colorTheme.onSurface : Colors.grey),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? context.colorTheme.onSurface : null,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: isSelected ? Icon(Icons.check_circle, color: context.colorTheme.onSurface) : null,
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: isSelected ? context.colorTheme.primaryContainer.withOpacity(0.5) : null,
    );
  }

  String _capitalizeFirstLetter(String text) {
    return text.isNotEmpty ? text[0].toUpperCase() + text.substring(1) : text;
  }

  IconData _getIconForMediaType(MediaTypeQuery media) {
    switch (media) {
      case MediaTypeQuery.movie:
        return Icons.movie;
      case MediaTypeQuery.music:
        return Icons.music_note;
      case MediaTypeQuery.podcast:
        return Icons.mic;
      case MediaTypeQuery.musicVideo:
        return Icons.music_video;
      case MediaTypeQuery.audiobook:
        return Icons.audiotrack;
      case MediaTypeQuery.shortFilm:
        return Icons.video_library;
      case MediaTypeQuery.tvShow:
        return Icons.tv;
      case MediaTypeQuery.software:
        return Icons.apps;
      case MediaTypeQuery.ebook:
        return Icons.book;
      case MediaTypeQuery.all:
        return Icons.all_inclusive;
    }
  }
}
