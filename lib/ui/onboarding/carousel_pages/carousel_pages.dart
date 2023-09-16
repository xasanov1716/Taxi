import 'package:flutter/material.dart';
import 'package:taxi_app/ui/onboarding/carousel_pages/widgets/page_view_icon_index.dart';
import 'package:taxi_app/ui/onboarding/carousel_pages/widgets/page_view_items.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

import '../../../utils/colors/app_colors.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    PageViewItems(
                      title: "We provide professional taxi services for you",
                      img: AppIcons.onBoarding1,
                    ),
                    PageViewItems(
                      title: "Your satisfaction is our number one priority",
                      img: AppIcons.onBoarding2,
                    ),
                    PageViewItems(
                      title: "Let's make your day great with Taxio right now!",
                      img: AppIcons.onBoarding3,
                    ),
                  ],
                ),
                Positioned(
                    bottom: 50 * height / 926,
                    child: PageIndexItem(activePageIndex: pageIndex)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: width / 12,
              left: width / 12,
              bottom: width / 10,
            ),
            child: Column(
              children: [
                pageIndex != 2
                    ? GlobalButton(
                        color: Color(0xFFFEBB1B),
                        title: "Next",
                        radius: 100,
                        textColor: Colors.black,
                        onTap: () {
                          if (pageIndex < 2) {
                            pageIndex++;
                            setState(() {
                              pageController.animateToPage(
                                pageIndex,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                              );
                            });
                          } else {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const TabsScreen(),
                            //   ),
                            // );
                          }
                        })
                    : GlobalButton(
                        color: Color(0xFFFEBB1B),
                        title: "Get Started",
                        radius: 100,
                        textColor: Colors.black,
                        onTap: () {}),
                SizedBox(height: height / 36),
              ],
            ),
          )
        ],
      ),
    );
  }
}
