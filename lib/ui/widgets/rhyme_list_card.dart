import 'package:flutter/material.dart';
import 'package:rhymer/ui/widgets/base_container.dart';

class RhymeListCard extends StatelessWidget {
  const RhymeListCard({
    super.key,
    this.isFavourite = false,
  });
  final bool isFavourite;
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
          IconButton(
            onPressed: () {},
            icon: isFavourite ? Icon(Icons.favorite, color: theme.primaryColor) : const Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
