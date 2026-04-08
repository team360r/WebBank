import 'package:flutter/material.dart';

import '../../data/mock_accounts.dart';
import '../../data/mock_transactions.dart';
import '../../data/models/account.dart';
import '../../data/models/transaction.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.accessible});

  final bool accessible;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good morning, ${MockAccounts.currentUser.name.split(' ').first}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 24),
          _AccountCardsGrid(accounts: MockAccounts.all),
          const SizedBox(height: 32),
          _QuickActions(),
          const SizedBox(height: 32),
          _RecentTransactions(
            transactions: MockTransactions.all.take(5).toList(),
          ),
        ],
      ),
    );
  }
}

class _AccountCardsGrid extends StatelessWidget {
  const _AccountCardsGrid({required this.accounts});
  final List<Account> accounts;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 3 : 1;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.6,
          ),
          itemCount: accounts.length,
          itemBuilder: (context, index) => _AccountCard(
            account: accounts[index],
          ),
        );
      },
    );
  }
}

class _AccountCard extends StatelessWidget {
  const _AccountCard({required this.account});
  final Account account;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isNegative = account.balance < 0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              account.name,
              style: theme.textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Text(
              '${isNegative ? "-" : ""}£${account.balance.abs().toStringAsFixed(2)}',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: isNegative ? theme.colorScheme.error : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ActionChip(
              avatar: const Icon(Icons.send, size: 18),
              label: const Text('Send Money'),
              onPressed: () {},
            ),
            ActionChip(
              avatar: const Icon(Icons.receipt, size: 18),
              label: const Text('Pay Bills'),
              onPressed: () {},
            ),
            ActionChip(
              avatar: const Icon(Icons.savings, size: 18),
              label: const Text('Save'),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _RecentTransactions extends StatelessWidget {
  const _RecentTransactions({required this.transactions});
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Transactions',
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Card(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final txn = transactions[index];
              final isCredit = txn.amount > 0;

              return ListTile(
                title: Text(txn.merchant),
                subtitle: Text(txn.category),
                trailing: Text(
                  '${isCredit ? "+" : ""}£${txn.amount.abs().toStringAsFixed(2)}',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: isCredit
                        ? const Color(0xFF2E7D32)
                        : theme.colorScheme.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
