import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/models/booking/booking_status.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/ui/tab_box/bookings/sub_screens/selected_request/selected_request_screen.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/expander_button.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/location_item.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/status_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class RequestView extends StatefulWidget {
  const RequestView({super.key, this.modelClient});

  final RequestModel? modelClient;

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SelectedRequestScreen(
              fromId: widget.modelClient!.fromId, toId: widget.modelClient!.toId);
        }));
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        duration: const Duration(milliseconds: 700),
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            Row(
              children: [
                20.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.modelClient!.creatorName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    6.ph,
                    Text(
                      widget.modelClient!.description,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                          color: getTheme(context) ? AppColors.c_300 : AppColors.c_700),
                    )
                  ],
                ),
                const Spacer(),
                const Column(
                  children: [BookingStatusButton(status: BookingStatus.active)],
                )
              ],
            ),
            16.ph,
            const Divider(),
            isExpanded
                ? LocationItem(
                    modelClient: widget.modelClient,
                    expandTap: () {
                      setState(() {
                        isExpanded = false;
                      });
                    },
                    mainButtonTap: () {},
                  )
                : BookingExpanderButton(
                    isExpanded: isExpanded,
                    expandTap: () {
                      setState(() {
                        isExpanded = true;
                      });
                    })
          ],
        ),
      ),
    );
  }
}
