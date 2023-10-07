import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/cancel_driver/widgets/cancellation_reasons.dart';
import 'package:taxi_app/ui/widgets/global_alert_dialog.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class CancelDriverScreen extends StatefulWidget {
  const CancelDriverScreen({super.key});

  @override
  State<CancelDriverScreen> createState() => _CancelDriverScreenState();
}

class _CancelDriverScreenState extends State<CancelDriverScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: tr('cancel_taxi'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        "${tr('please_select_cancellation')}:",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 16.sp),
                      ),
                    ),
                    const CancellationReasons(),
                    GlobalTextField(
                      hintText: tr('others_reason'),
                      textInputAction: TextInputAction.done,
                      controller: controller,

                    ),
                    24.ph
                  ],
                ),
              ),
            ),
            GlobalButton(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              title:tr('submit'),
              onTap: () {
                showGlobalAlertDialog(
                    context: context,
                    title: tr('were_so_dad_cancellation'),
                    text:
                        "${tr('wi_will_continue')}.",
                    image: AppIcons.smileUnhappy,
                    onTap: () {
                      Navigator.pop(context);
                    });
              },
              textColor: AppColors.c_900,
              radius: 100.r,
              color: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }
}
