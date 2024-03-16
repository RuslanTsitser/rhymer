import 'package:flutter/material.dart';

void main() {
  runApp(const RhymerApp());
}

class RhymerApp extends StatelessWidget {
  const RhymerApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.purple;
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEFF1F3),
        primarySwatch: primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: CustomScrollView(
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
              itemBuilder: (context, index) {
                return const RhymeListCard();
              },
              itemCount: 20,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: theme.hintColor,
          selectedItemColor: theme.primaryColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ));
  }
}

class HistoryListCard extends StatelessWidget {
  const HistoryListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rhymes = List.generate(4, (index) => Text('Rhyme $index'));
    final theme = Theme.of(context);
    return BaseContainer(
      padding: const EdgeInsets.all(16),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Word', style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
          Wrap(
            children: rhymes
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: e,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    this.width,
    this.margin,
    this.padding = const EdgeInsets.all(12),
  });
  final Widget child;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        width: width ?? double.infinity,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child);
  }
}

class RhymeListCard extends StatelessWidget {
  const RhymeListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      padding: const EdgeInsets.only(left: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Rhyme ', style: theme.textTheme.bodyLarge),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        ],
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.hintColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: theme.hintColor,
          ),
          const SizedBox(width: 12),
          Text(
            'Search rhymes...',
            style: TextStyle(color: theme.hintColor, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
