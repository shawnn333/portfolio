import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/routes/app_routes.dart';
import '../../providers/settings_provider.dart';
import '../../widgets/activity_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LAB ACTIVITY MASTER',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Settings',
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.settings),
            icon: const Icon(Icons.settings_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= 760;
            final contentWidth = wide ? 900.0 : double.infinity;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: contentWidth),
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    wide ? 32 : 20,
                    12,
                    wide ? 32 : 20,
                    32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              scheme.primary,
                              scheme.primary.withValues(alpha: 0.78),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.16),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Icon(
                                Icons.school_outlined,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Hello, ${settings.userName}.',
                              style: theme.textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Your central space for laboratory activities.',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: Colors.white.withValues(alpha: 0.88),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Laboratory Activities',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Select an activity to continue.',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 18),
                      if (wide)
                        Row(
                          children: [
                            Expanded(
                              child: ActivityCard(
                                number: '01',
                                title: 'Laboratory Activity 1',
                                description:
                                    'Workspace for your first laboratory activity.',
                                icon: Icons.looks_one_outlined,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.activity1,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ActivityCard(
                                number: '02',
                                title: 'Laboratory Activity 2',
                                description:
                                    'Workspace for your second laboratory activity.',
                                icon: Icons.looks_two_outlined,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.activity2,
                                ),
                              ),
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            ActivityCard(
                              number: '01',
                              title: 'Laboratory Activity 1',
                              description:
                                  'Workspace for your first laboratory activity.',
                              icon: Icons.looks_one_outlined,
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.activity1,
                              ),
                            ),
                            const SizedBox(height: 14),
                            ActivityCard(
                              number: '02',
                              title: 'Laboratory Activity 2',
                              description:
                                  'Workspace for your second laboratory activity.',
                              icon: Icons.looks_two_outlined,
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.activity2,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 28),
                      Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 6,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: scheme.secondaryContainer,
                            child: Icon(
                              Icons.settings_outlined,
                              color: scheme.onSecondaryContainer,
                            ),
                          ),
                          title: const Text(
                            'Settings',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          subtitle: const Text('Appearance and profile'),
                          trailing: const Icon(Icons.chevron_right_rounded),
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.settings,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
