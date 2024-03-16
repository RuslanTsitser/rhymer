import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rhymer/features/search/presentation/widgets/history_list_card.dart';
import 'package:rhymer/features/search/presentation/widgets/search_button.dart';
import 'package:rhymer/ui/widgets/rhyme_list_card.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          title: Text('Rhymer'),
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: SearchButton(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) => const HistoryListCard(),
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              scrollDirection: Axis.horizontal,
              itemCount: 20,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverList.builder(
          itemBuilder: (context, index) => const RhymeListCard(),
          itemCount: 20,
        ),
      ],
    );
  }
}
