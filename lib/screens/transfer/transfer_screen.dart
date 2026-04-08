import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key, required this.accessible});

  final bool accessible;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Transfer — coming soon'),
    );
  }
}
