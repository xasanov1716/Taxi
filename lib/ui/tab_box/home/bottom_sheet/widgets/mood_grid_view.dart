import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class MoodGridView extends StatefulWidget {
  const MoodGridView({super.key});

  @override
  State<MoodGridView> createState() => _MoodGridViewState();
}

class _MoodGridViewState extends State<MoodGridView> {
  List<String> smiles = [
    AppIcons.smileUnhappy,
    AppIcons.smileCry,
    AppIcons.smileTired,
    AppIcons.smileAngry,
    AppIcons.smileQuiet,
    AppIcons.smileVeryHappy,
    AppIcons.smileExcited,
    AppIcons.smileHappy,
    AppIcons.smileEyeGlass
  ];

  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          ...List.generate(
            smiles.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  if (selectedIndex == index) {
                    selectedIndex = -1;
                  } else {
                    selectedIndex = index;
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.all(16.r),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: selectedIndex == index
                        ? AppColors.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  smiles[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
