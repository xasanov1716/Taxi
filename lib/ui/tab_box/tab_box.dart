import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/cubits/tab/tab_cubit.dart';
import 'package:taxi_app/ui/bookings/bookings_screen.dart';
import 'package:taxi_app/ui/home/home_screen.dart';
import 'package:taxi_app/ui/inbox/inbox_screen.dart';
import 'package:taxi_app/ui/profile/profile_screen.dart';
import 'package:taxi_app/ui/wallet/wallet_screen.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

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
          backgroundColor: AppColors.dark1,
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
              icon: SvgPicture.asset(
                AppIcons.home,
                colorFilter: ColorFilter.mode(context.watch<TabCubit>().state==0?AppColors.primary:AppColors.c_500, BlendMode.screen),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.bookmark,
                colorFilter: ColorFilter.mode(context.watch<TabCubit>().state==1?AppColors.primary:AppColors.c_500, BlendMode.screen),
              ),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.chat,
                colorFilter: ColorFilter.mode(context.watch<TabCubit>().state==2?AppColors.primary:AppColors.c_500, BlendMode.screen),
              ),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.wallet,
                colorFilter: ColorFilter.mode(context.watch<TabCubit>().state==3?AppColors.primary:AppColors.c_500, BlendMode.screen),
              ),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.profile,
                colorFilter: ColorFilter.mode(context.watch<TabCubit>().state==4?AppColors.primary:AppColors.c_500, BlendMode.screen),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: context.watch<TabCubit>().state,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.c_500,
          onTap: context.read<TabCubit>().changeTabIndex,
        ),
      ),
    );
  }
}
