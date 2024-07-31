import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/app_network_provider.dart';

class NetworkAwareWidget extends ConsumerStatefulWidget {
  final Widget child;
  final Widget? offlineWidget;

  const NetworkAwareWidget({
    super.key,
    required this.child,
    this.offlineWidget,
  });

  @override
  ConsumerState<NetworkAwareWidget> createState() => _NetworkAwareWidgetState();
}

class _NetworkAwareWidgetState extends ConsumerState<NetworkAwareWidget> {
  bool _hasUserDismissedBanner = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateConnectionBanner();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(appConnectionProvider, (previous, next) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateConnectionBanner();
      });
    });

    final isConnected = ref.watch(appConnectionProvider) == ConnectionStatus.connected;

    return Stack(
      children: [
        widget.child,
        if (!isConnected && widget.offlineWidget != null) widget.offlineWidget!,
      ],
    );
  }

  void _updateConnectionBanner() {
    if (ref.read(appConnectionProvider) != ConnectionStatus.connected && !_hasUserDismissedBanner) {
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
          content: const Text(
            "No Internet Connection",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          leading: const Icon(Icons.wifi_off, color: Colors.white),
          backgroundColor: Colors.red.shade300,
          actions: [
            TextButton(
              child: const Text('Dismiss', style: TextStyle(color: Colors.white)),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                setState(() {
                  _hasUserDismissedBanner = true;
                });
              },
            ),
            TextButton(
              child: const Text('Retry', style: TextStyle(color: Colors.white)),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                _retryConnection();
              },
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    }
  }

  void _retryConnection() {
    setState(() {
      _hasUserDismissedBanner = false;
    });
    _updateConnectionBanner();
  }
}
