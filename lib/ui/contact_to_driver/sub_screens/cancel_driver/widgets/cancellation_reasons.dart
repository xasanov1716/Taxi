import 'package:flutter/material.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/cancel_driver/widgets/checkbox_row.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class CancellationReasons extends StatelessWidget {
  const CancellationReasons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        24.ph,
        const CancelDriverCheckBoxRow(
          text: "Waiting for long time",
        ),
        const CancelDriverCheckBoxRow(
          text: "Unable to contact driver",
        ),
        const CancelDriverCheckBoxRow(
          text: "Driver denied to go to destination",
        ),
        const CancelDriverCheckBoxRow(
          text: "Driver denied to come to pickup",
        ),
        const CancelDriverCheckBoxRow(
          text: "Wrong address shown",
        ),
        const CancelDriverCheckBoxRow(
          text: "The price is not reasonable",
        ),
        const CancelDriverCheckBoxRow(
          text: "The price is not reasonable",
        ),
        24.ph,
        Text(
          "Others",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        16.ph,
      ],
    );
  }
}
