import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

RichText highlightText(String text, String query, BuildContext context) {
  final matches = RegExp(query, caseSensitive: false).allMatches(text);

  if (matches.isEmpty) {
    return RichText(
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.titleLarge, // Default style
      ),
    );
  }

  final List<TextSpan> children = [];

  int start = 0;
  for (final match in matches) {
    if (match.start > start) {
      children.add(TextSpan(
        text: text.substring(start, match.start),
        style: Theme.of(context).textTheme.titleLarge // Highlighted style
        , // Default style
      ));
    }

    children.add(TextSpan(
      text: text.substring(match.start, match.end),
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: AppColors.primary),
    ));

    start = match.end;
  }

  if (start < text.length) {
    children.add(
      TextSpan(
          text: text.substring(start),
          style: Theme.of(context).textTheme.titleLarge),
    );
  }

  return RichText(
    text: TextSpan(
      children: children,
    ),
  );
}
