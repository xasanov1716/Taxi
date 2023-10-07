import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

import 'package:taxi_app/data/local/search_location/places_db.dart';

class RequestDriverAddress extends StatefulWidget {
  const RequestDriverAddress({super.key, this.modelDriver});

  final RequestModel? modelDriver;

  @override
  State<RequestDriverAddress> createState() => _RequestDriverAddressState();
}

class _RequestDriverAddressState extends State<RequestDriverAddress> {
  String fromRegion = "";
  String toRegion = "";

  @override
  void initState() {
    _getFromRegions(id: widget.modelDriver!.fromId);
    _getToRegions(id: widget.modelDriver!.toId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Center(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                                color: getTheme(context) ? AppColors.white : AppColors.yellow)),
                        child: const Text("Dan")))),
            Expanded(
                child: Center(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                                color: getTheme(context) ? AppColors.white : AppColors.yellow)),
                        child: const Text("Ga")))),
          ],
        ),
        12.ph,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: getTheme(context) ? AppColors.white : AppColors.yellow)),
          child: Row(
            children: [
              Expanded(
                  child: Center(
                      child: Text(
                fromRegion,
                textAlign: TextAlign.center,
              ))),
              SizedBox(
                height: 35.w,
                width: 35.w,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.r), child: Image.asset(AppIcons.fromTo)),
              ),
              Expanded(
                  child: Center(
                      child: Text(
                toRegion,
                textAlign: TextAlign.center,
              ))),
            ],
          ),
        ),
      ],
    );
  }

  _getFromRegions({required int id}) async {
    List<String> fromRegions =
        (await PlacesDatabase.instance.getRegionById(id: id)).map((e) => e.name).toList();
    fromRegion = fromRegions.first;
    setState(() {});
  }

  _getToRegions({required int id}) async {
    List<String> toRegions =
        (await PlacesDatabase.instance.getRegionById(id: id)).map((e) => e.name).toList();
    toRegion = toRegions.first;
    setState(() {});
  }
}
