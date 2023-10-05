import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/local/search_location/places_db.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
class RequestAddress extends StatefulWidget {
  const RequestAddress({super.key, this.modelClient});

  final RequestModel? modelClient;

  @override
  State<RequestAddress> createState() => _RequestAddressState();
}

class _RequestAddressState extends State<RequestAddress> {
  String fromRegion = "";
  String toRegion = "";

  @override
  void initState() {
    _getFromRegions(id: widget.modelClient!.fromId);
    _getToRegions(id: widget.modelClient!.toId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.ph,
        Container(
          padding: EdgeInsets.all(6.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(width: 1, color: getTheme(context) ? AppColors.white : AppColors.yellow)
          ),
          child: Row(
            children: [
              Expanded(child: Center(child: Text(fromRegion, textAlign: TextAlign.center,))),
              SizedBox(height: 45.w, width: 45.w, child: ClipRRect(borderRadius: BorderRadius.circular(30.r), child: Image.asset(AppIcons.fromTo)),),
              Expanded(child: Center(child: Text(toRegion, textAlign: TextAlign.center,))),
            ],
          ),
        ),
      ],
    );
  }

  _rowMaker(BuildContext context, String title) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.dimYellow, width: 8.w),
            gradient: AppColors.gradientOrangeYellow,
            shape: BoxShape.circle,
          ),
          child:
          SvgPicture.asset(AppIcons.getSvg(name: AppIcons.currentLocation)),
        ),
        20.pw,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            6.ph,
          ],
        )
      ],
    );
  }

  _getFromRegions({required int id}) async {
    List<String> fromRegions = (await PlacesDatabase.instance.getRegionById(id: id))
        .map((e) => e.name)
        .toList();
    fromRegion = fromRegions.first;
    setState(() { });
  }

  _getToRegions({required int id}) async {
    List<String> toRegions = (await PlacesDatabase.instance.getRegionById(id: id))
        .map((e) => e.name)
        .toList();
    toRegion = toRegions.first;
    setState(() { });
  }
}
