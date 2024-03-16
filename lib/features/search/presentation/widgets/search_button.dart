import 'package:flutter/material.dart';

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
