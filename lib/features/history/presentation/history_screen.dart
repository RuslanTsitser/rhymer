import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rhymer/ui/widgets/history_list_card.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          title: Text('History'),
          surfaceTintColor: Colors.transparent,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => const HistoryListCard(),
                childCount: 20,
              )),
        ),
      ],
    );
  }
}
