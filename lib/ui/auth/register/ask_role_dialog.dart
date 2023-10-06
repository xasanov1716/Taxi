import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/utils/constants/constants.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

void showRoleDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return Theme(
        data: getTheme(context) ? ThemeData.dark() : ThemeData.light(),
        child: CupertinoAlertDialog(
          content: Text(
            tr("driver_or_client?"),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          title: Image.asset(AppIcons.taxiLogotip),
          actions: [
            TextButton(
              onPressed: () {
                StorageRepository.putString(
                    StorageKeys.userRole, AppConstants.driver);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteNames.editProfileDriver,
                  arguments: true,
                  (route) => false,
                );
              },
              child: Text(
                tr('driver'),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            TextButton(
              onPressed: () {
                StorageRepository.putString(
                    StorageKeys.userRole, AppConstants.client);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteNames.editProfileClient,
                  arguments: true,
                  (route) => false,
                );
              },
              child: Text(
               tr('client'),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      );
    },
  );
}
