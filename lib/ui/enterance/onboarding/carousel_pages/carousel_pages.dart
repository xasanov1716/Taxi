import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/enterance/onboarding/carousel_pages/widgets/on_boarding_appbar.dart';
import 'package:taxi_app/ui/enterance/onboarding/carousel_pages/widgets/page_view_icon_index.dart';
import 'package:taxi_app/ui/enterance/onboarding/carousel_pages/widgets/page_view_item.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class CarouselPages extends StatefulWidget {
  const CarouselPages({super.key});

  @override
  State<CarouselPages> createState() => _CarouselPagesState();
}

class _CarouselPagesState extends State<CarouselPages> {
  int pageIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const OnBoardingAppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children:  [
                PageViewItem(
                  title:
                      tr("on_boarding_first_text"),
                  img: AppIcons.onBoarding1,
                ),
                PageViewItem(
                  title:
                      tr("on_boarding_second_text"),
                  img: AppIcons.onBoarding2,
                ),
                PageViewItem(
                  title:
                     tr("on_boarding_three_text!"),
                  img: AppIcons.onBoarding3,
                ),
              ],
            ),
          ),
          PageIndexItem(activePageIndex: pageIndex),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width/16,
              vertical: width/16,
            ),
            child: GlobalButton(
                color: const Color(0xFFFEBB1B),
                title: pageIndex != 2 ? tr( "next") : tr( "get_started"),
                radius: 100,
                textColor: Colors.black,
                onTap: () async {
                  if (pageIndex < 2) {
                    pageIndex++;
                    setState(() {
                      pageController.animateToPage(
                        pageIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    });
                  }
                  if (pageIndex == 2) {
                    await StorageRepository.putBool(StorageKeys.welcomeDone, true);
                    if (context.mounted) {
                      Navigator.pushReplacementNamed(
                        context,
                        RouteNames.letsIn,
                      );
                    }
                  }
                }),
          )
        ],
      ),
    );
  }
}
