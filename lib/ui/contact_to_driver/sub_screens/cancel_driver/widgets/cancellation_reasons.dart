import 'package:easy_localization/easy_localization.dart';
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
         CancelDriverCheckBoxRow(
          text:tr('waiting_long_time'),
        ),
         CancelDriverCheckBoxRow(
          text:tr('unable_driver'),
        ),
         CancelDriverCheckBoxRow(
          text:tr('driver_denied_destination'),
        ),
         CancelDriverCheckBoxRow(
          text: tr('driver_denied_pickup'),
        ),
         CancelDriverCheckBoxRow(
          text: tr('wrong_address_shown'),
        ),
         CancelDriverCheckBoxRow(
          text: tr('price_reasonable'),
        ),
         CancelDriverCheckBoxRow(
          text:tr('price_reasonable'),
        ),
        24.ph,
        Text(
          tr('Boshqalar'),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        16.ph,
      ],
    );
  }
}
