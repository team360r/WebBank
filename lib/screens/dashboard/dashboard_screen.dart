import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.accessible});

  final bool accessible;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Dashboard — coming soon'),
    );
  }
}
