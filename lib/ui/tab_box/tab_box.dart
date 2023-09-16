import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/cubits/tab/tab_cubit.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/tab_box/bookings/bookings_screen.dart';
import 'package:taxi_app/ui/tab_box/home/home_screen.dart';
import 'package:taxi_app/ui/tab_box/inbox/inbox_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/profile_screen.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

import 'wallet/wallet_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  static List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const BookingsScreen(),
      const InboxScreen(),
      const WalletScreen(),
      const ProfileScreen()
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.watch<TabCubit>().state,
        children: screens,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
            fontFamily: "Urbanist",
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            height: 12 / 10,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: "Urbanist",
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.c_500,
            height: 12 / 10,
          ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.home,
                  iconType: IconType.bold,
                ),
                colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(AppIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.bookmark),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.chat),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.profile,
                  iconType: IconType.bold,
                ),
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(AppIcons.profile),
              label: 'Profile',
            ),
          ],
          currentIndex: context.watch<TabCubit>().state,
          //selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.c_500,
          onTap: context.read<TabCubit>().changeTabIndex,
        ),
      ),
    );
  }
}
