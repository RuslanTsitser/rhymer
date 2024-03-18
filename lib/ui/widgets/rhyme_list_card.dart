import 'package:flutter/material.dart';
import 'package:rhymer/ui/widgets/base_container.dart';

class RhymeListCard extends StatelessWidget {
  const RhymeListCard({
    super.key,
    this.isFavourite = false,
    required this.rhyme,
    this.sourceWord,
  });

  final bool isFavourite;
  final String rhyme;
  final String? sourceWord;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      padding: const EdgeInsets.only(left: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (sourceWord != null) ...[
                Text(sourceWord!, style: theme.textTheme.bodyLarge),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: theme.hintColor,
                    size: 16,
                  ),
                ),
              ],
              Text(rhyme, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: isFavourite ? Icon(Icons.favorite, color: theme.primaryColor) : const Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
