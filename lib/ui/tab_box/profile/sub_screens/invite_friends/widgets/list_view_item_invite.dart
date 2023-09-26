import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class InviteListViewItem extends StatefulWidget {
  const InviteListViewItem({super.key, required this.name, required this.phone, required this.image});
  final String name;
  final String phone;
  final String image;

  @override
  State<InviteListViewItem> createState() => _InviteListViewItemState();
}

class _InviteListViewItemState extends State<InviteListViewItem> {
  bool isInvited = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w,vertical: 12.h),
      child: Row(
        children: [
          Image.asset(
            widget.image,
            width: 60.w,
          ),
          20.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.name,style:Theme.of(context).textTheme.titleLarge ,),
              Text(widget.phone,style:Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.c_700) ,)
            ],
          ),
          const  Spacer(),
          !isInvited?  Ink(
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: AppColors.primary,
            ),
            child: InkWell(
              onTap: ()async{
                final result = await Share.shareWithResult('We invite you to Dastyor Taxi application');
                if (result.status == ShareResultStatus.success) {
                  setState(() {
                    isInvited=true;
                  });
                }
              },
              borderRadius: BorderRadius.circular(100.r),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 6.h),
                child: Center(
                  child: Text("Invite",style: AppTextStyle.bodyMediumSemibold.copyWith(color: AppColors.dark3),),
                ),
              ),
            ),
          ):
          Ink(
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(width: 2.w,color: AppColors.primary)
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(100.r),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 6.h),
                child: Center(
                  child: Text("Invited",style: AppTextStyle.bodyMediumSemibold.copyWith(color: AppColors.primary),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
