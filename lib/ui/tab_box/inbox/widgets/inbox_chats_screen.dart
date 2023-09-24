import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class InboxChatScreen extends StatelessWidget {
  const InboxChatScreen({super.key, required this.onTapChat});

  final VoidCallback onTapChat;

  @override
  Widget build(BuildContext context) {
    print({width, height});
    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
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
                        height: 29.h,
                        width: 29.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                        child: Center(
                          child: Text(
                            '5',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      width >= 600 ? 0.0005.ph : 10.ph,
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