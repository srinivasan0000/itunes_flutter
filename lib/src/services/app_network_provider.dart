// ignore_for_file: unused_field

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_network_provider.g.dart';

enum ConnectionStatus { connected, disconnected, notDetermined }

@Riverpod(keepAlive: true)
class AppConnection extends _$AppConnection {
  Timer? _debounceTimer;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  ConnectionStatus build() {
    _initConnectivity();
    return ConnectionStatus.notDetermined;
  }

  void _initConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectionStatus(connectivityResult);

    _subscription = Connectivity().onConnectivityChanged.listen(_debounceUpdateStatus);
  }

  void _debounceUpdateStatus(List<ConnectivityResult> results) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      _updateConnectionStatus(results);
    });
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    final result = results.first;
    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
      case ConnectivityResult.vpn:
        state = ConnectionStatus.connected;
        break;
      case ConnectivityResult.none:
        state = ConnectionStatus.disconnected;
        break;
      default:
        state = ConnectionStatus.notDetermined;
    }
  }
}
