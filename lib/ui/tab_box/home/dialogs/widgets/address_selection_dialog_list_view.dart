import 'package:flutter/material.dart';

class AddressSelectionDialogListView extends StatelessWidget {
  const AddressSelectionDialogListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ...List.generate(
            10,
            (index) => ListTile(
              title: const Text("Eleonora Hotel"),
              subtitle: const Text("6 Glendale St. Worcester, MA 01604"),
              leading: const Icon(Icons.watch_later_outlined),
              trailing: Text(
                "2.9 km",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          )
        ],
      ),
    );
  }
}
