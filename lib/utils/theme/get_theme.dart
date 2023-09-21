import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';

getTheme(BuildContext context) {
  return AdaptiveTheme.of(context).theme == AdaptiveTheme.of(context).darkTheme;
}
