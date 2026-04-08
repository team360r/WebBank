import 'package:flutter/material.dart';
import '../../app_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
    required this.accessible,
    required this.appState,
  });

  final bool accessible;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Settings — coming soon'),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: appState.logout,
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
