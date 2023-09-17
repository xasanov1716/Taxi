import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  const PopUp({super.key, required this.onMoreTap});

  final ValueChanged<int> onMoreTap;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(
        Icons.more_vert,
        color: Theme.of(context).iconTheme.color,
      ),
      onSelected: onMoreTap,
      position: PopupMenuPosition.values.last,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
          value: 1,
          child: Text('Male'),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text('Female'),
        ),
      ],
    );
  }
}
