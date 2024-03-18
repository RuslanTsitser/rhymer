import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rhymer/features/settings/presentation/widgets/settings_toggle_card.dart';
import 'package:rhymer/ui/widgets/base_container.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          title: Text('Settings'),
          surfaceTintColor: Colors.transparent,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: SettingsToggleCard(title: 'Dark theme', value: true, onChanged: (value) {}),
        ),
        SliverToBoxAdapter(
          child: SettingsToggleCard(title: 'Notifications', value: true, onChanged: (value) {}),
        ),
        SliverToBoxAdapter(
          child: SettingsToggleCard(title: 'Разрешить аналитику', value: true, onChanged: (value) {}),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: SettingsActionCard(
            title: 'Clear history',
            icon: Icons.delete_sweep_outlined,
            iconColor: Colors.red,
            onTap: () {},
          ),
        ),
        SliverToBoxAdapter(
          child: SettingsActionCard(
            title: 'Support',
            icon: Icons.support_agent_outlined,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class SettingsActionCard extends StatelessWidget {
  const SettingsActionCard({super.key, required this.title, this.onTap, required this.icon, this.iconColor});
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: BaseContainer(
        margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  color: iconColor ?? theme.hintColor,
                  size: 32,
                )),
          ],
        ),
      ),
    );
  }
}
