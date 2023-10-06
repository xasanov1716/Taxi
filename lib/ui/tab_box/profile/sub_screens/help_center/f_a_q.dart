import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/cubits/search/search_cubit.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/help_center/widgets/categories.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/help_center/widgets/search_widget.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/help_center/widgets/help_taxio/help_data.dart';

class FaQScreen extends StatefulWidget {
  const FaQScreen({super.key});

  @override
  State<FaQScreen> createState() => _FaQScreenState();
}

class _FaQScreenState extends State<FaQScreen> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24 * width / figmaWidth),
      child: ListView(
        children: [
          24.ph,
          const Categories(),
          SearchScreen(
            onChanged: (hasFocus) {
              if (hasFocus) {
                setState(() {
                  isTapped = true;
                });
              } else {
                setState(() {
                  isTapped = false;
                });
              }
            },
          ),
          BlocBuilder<SearchCubit, List<String>>(
            builder: (context, state) {
              return Visibility(
                visible: isTapped,
                child: Container(
                  height: 250 * height / figmaHeight,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: getTheme(context) ? AppColors.dark2 : AppColors.white,
                  ),
                  child: ListView(
                    children: [
                      ...List.generate(
                        state.length,
                        (index) => ListTile(
                          subtitle: const Divider(),
                          title: Text(
                            state[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          24.ph,
          const HelpData(
            textOne: 'What is Taxio?',
            texTwo:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          ),
          24.ph,
          const HelpData(
            textOne: 'How to use Taxio?',
            texTwo:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          ),
          24.ph,
          const HelpData(
            textOne: 'How do I cancel a taxi booking?',
            texTwo:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          ),
          24.ph,
          const HelpData(
            textOne: 'Is Taxio free to use?',
            texTwo:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          ),
          24.ph,
          const HelpData(
            textOne: 'How to add promo on Taxio?',
            texTwo:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          ),
        ],
      ),
    );
  }
}
