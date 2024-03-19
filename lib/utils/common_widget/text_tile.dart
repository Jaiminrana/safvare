import 'package:flutter/material.dart';
import 'package:sofvare/utils/extensions.dart';

class TextTile extends StatelessWidget {
  const TextTile({
    super.key,
    required this.title,
    this.subTitle,
  });

  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          if (subTitle != null)
            Text(
              subTitle!,
              style: context.textTheme.bodySmall,
            )
        ],
      ),
    );
  }
}
