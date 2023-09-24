import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/widgets/date_formatter.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

class InboxCallScreen extends StatelessWidget {
  const InboxCallScreen({super.key, required this.onTapCall});
  final VoidCallback onTapCall;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              ...List.generate(
                15,
                (index) => ListTile(
                  leading: Image.asset(AppIcons.taxiLogotip),
                  title: Text(
                    "Tanner Stafford",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Row(
                    children: [
                      SvgPicture.asset(AppIcons.getSvg(
                          name: AppIcons.arrowDownSquare,
                          iconType: IconType.bold)),
                      4.pw,
                      RichText(
                        text: TextSpan(
                          text: ' Outgoing ',
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: <TextSpan>[
                            TextSpan(
                              text: ' | ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: formatDateTime(DateTime.now()),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  trailing: getIcon(AppIcons.call, context: context, onTap: onTapCall),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
