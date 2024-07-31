import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/query_state.dart';
import '../states/search_state.dart';

class SearchFieldWidget extends StatefulWidget {
  final bool isHome;
  final VoidCallback? onTap;

  const SearchFieldWidget({
    super.key,
    this.isHome = false,
    this.onTap,
  });

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Hero(
          tag: 'searchField',
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                // autofocus: !widget.isHome,
                controller: _controller,
                onTap: widget.onTap,
                readOnly: widget.isHome,
                onChanged: widget.isHome
                    ? null
                    : (value) {
                        setState(() {});
                        ref.read(queryParamProvider.notifier).setTerm(value);
                        if (value.isNotEmpty) {
                          ref.read(searchStateProvider.notifier).search(ref.read(queryParamProvider));
                        } else if (value.trim() == '') {
                          ref.read(searchStateProvider.notifier).clearSearch();
                        }
                      },
                style: const TextStyle(fontSize: 16, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Search iTunes',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              _controller.clear();
                            });
                            ref.read(queryParamProvider.notifier).clearTerm();
                            ref.read(searchStateProvider.notifier).clearSearch();
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
