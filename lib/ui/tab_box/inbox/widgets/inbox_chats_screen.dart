import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class InboxChatScreen extends StatelessWidget {
  const InboxChatScreen({super.key, required this.onTapChat});
  final VoidCallback onTapChat;
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
                      4.pw,
                      Text(
                        'I just completed it 😂😂',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  trailing: Column(
                    children: [
                      Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.primary),
                          child: Center(
                              child: Text(
                            '5',
                            style: Theme.of(context).textTheme.bodySmall,
                          ))),
                      10.ph,
                      Text(
                        DateTime.now().toString().substring(10, 16),
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  onTap: onTapChat,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
