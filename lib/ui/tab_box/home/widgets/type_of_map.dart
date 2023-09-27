import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/cubits/address_cubit/address_cubit.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class TypeOfMap extends StatelessWidget {
  const TypeOfMap({super.key});



  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MapType>(
      color: AppColors.dimYellow.withOpacity(0.9),
      icon: Container(
        height: 50.w,
        width: 50.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.dimYellow),
        child: Icon(
          Icons.map_rounded,
          color: context.watch<AddressCubit>().mapType == MapType.satellite
              ? const Color(0xFF00ACC1)
              : context.watch<AddressCubit>().mapType == MapType.hybrid
              ? const Color(0xFF00ACC1)
              : Colors.white,
        ),
      ),
      onSelected: (MapType result) {
        context.read<AddressCubit>().mapType=result;
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MapType>>[
        _buildMapTypeMenuItem(
          context: context,
          text: 'Normal',
          mapType: MapType.normal,
          iconPath: AppIcons.normal,
        ),
        _buildMapTypeMenuItem(
          context: context,
          text: 'Satellite',
          mapType: MapType.satellite,
          iconPath: AppIcons.satellite,
        ),
        _buildMapTypeMenuItem(
          context: context,
          text: 'Hybrid',
          mapType: MapType.hybrid,
          iconPath: AppIcons.hybrid,
        ),
        _buildMapTypeMenuItem(
          context: context,
          text: 'Terrain',
          mapType: MapType.terrain,
          iconPath: AppIcons.terrain,
        ),
      ],
    );
  }

  PopupMenuItem<MapType> _buildMapTypeMenuItem({
    required String text,
    required MapType mapType,
    required String iconPath,
    required BuildContext context,
  }) {
    return PopupMenuItem<MapType>(
      onTap: () {
        context.read<AddressCubit>().updateMapType(mapType);
      },
      value: mapType,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style:Theme.of(context).textTheme.bodyLarge!.copyWith( color:context.read<AddressCubit>().mapType==mapType?Colors.blue: Colors.white),
          ),
          Image.asset(iconPath, height: 30, width: 30),
        ],
      ),
    );
  }
}