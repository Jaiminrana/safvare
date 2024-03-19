import 'package:flutter/material.dart';
import 'package:sofvare/utils/extensions.dart';

class TextBodyLarge extends StatelessWidget {
  const TextBodyLarge(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.bodyLarge,
    );
  }
}
