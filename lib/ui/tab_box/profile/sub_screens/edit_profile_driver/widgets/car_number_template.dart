import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class CarNumberContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 4, color: AppColors.dark3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.dark3,
            ),
          ),
          const Text(
            '00',
            style: TextStyle(
              color: Colors.black,
              fontSize: 50,
              fontFamily: 'Chakra Petch',
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            'A 132 NN',
            style: TextStyle(
              color: Colors.black,
              fontSize: 50,
              fontFamily: 'Chakra Petch',
              fontWeight: FontWeight.w700,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30.w,
                height: 30.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppIcons.uzbFlagCarNumber),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: 6.w,
                height: 6.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.dark3,
                ),
              ),
              const Text(
                'UZ',
                style: TextStyle(
                  color: Color(0xFF3368CF),
                  fontSize: 22,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
