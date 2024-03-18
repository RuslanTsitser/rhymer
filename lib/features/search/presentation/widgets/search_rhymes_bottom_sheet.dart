import 'package:flutter/material.dart';
import 'package:rhymer/ui/widgets/base_bottom_sheet.dart';

class SearchRhymesBottomSheet extends StatelessWidget {
  const SearchRhymesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseBottomSheet(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.highlightColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Start typing...',
                        hintStyle: TextStyle(color: theme.hintColor.withOpacity(0.5)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        border: const OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.search, color: Colors.white),
                )
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) => const ListTile(title: Text('Rhyme idea')),
            separatorBuilder: (context, _) => const Divider(height: 2),
            itemCount: 15,
          )),
        ],
      ),
    );
  }
}
