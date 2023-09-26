import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class LogOutItem extends StatelessWidget {
  const LogOutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getTheme(context)?AppColors.dark1:AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            12.ph,
            Text(
              "Log Out",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColors.error),
            ),
            24.ph,
            Divider(),
            24.ph,
            Text("Are you sure you want to log out?",style: Theme.of(context).textTheme.headlineSmall,),
            24.ph,
            Row(
              children: [
                Expanded(child: GlobalButton(textColor: getTheme(context)?AppColors.white:AppColors.dark1,title: "Cancel", onTap: (){
                  Navigator.pop(context);
                },color:getTheme(context)?AppColors.dark3: AppColors.orangeBackground,radius: 100.r,)),
                12.pw,
                Expanded(child: GlobalButton(title: "Yes, Logout", onTap: (){
                  StorageRepository.deleteString(StorageKeys.pinCode);
                  SystemNavigator.pop();
                },color: AppColors.primary,radius: 100.r,)),
              ],
            ),
            48.ph,
          ],
        ),
      ),
    );
  }
}
