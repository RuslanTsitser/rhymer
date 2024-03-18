import 'package:flutter/material.dart';
import 'package:rhymer/ui/widgets/base_container.dart';

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
          Flexible(
            child: Text(
              rhymes.asMap().entries.map((e) {
                final sb = StringBuffer();
                sb.write(e.value);
                if (e.key != rhymes.length - 1) {
                  sb.write(', ');
                }
                return sb.toString();
              }).join(),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
