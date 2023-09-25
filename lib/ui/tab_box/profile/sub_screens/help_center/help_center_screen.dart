import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/help_center/widgets/categories.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/help_center/widgets/search_widget.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'widgets/help_taxio/person_data.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
      appBar: GlobalAppBar(
        title: "Help Center",
        onTap: () {
          Navigator.pop(context);
        },
        action: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(AppIcons.moreCircle)),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 24 * width / figmaWidth,
          right: 24 * width / figmaWidth,
        ),
        child: ListView(
          children: [
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
                    height: 250,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color:
                          getTheme(context) ? AppColors.dark2 : AppColors.white,
                    ),
                    child: ListView(
                      children: [
                        ...List.generate(
                            state.length,
                            (index) => ListTile(
                                  subtitle: Divider(),
                                  title: Text(
                                    state[index],
                                  ),
                                ))
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
      ),
    );
  }
}
