import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/widgets/promos_button.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/widgets/select_transport_bottomsheet.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class SelectDriverScreen extends StatefulWidget {
  const SelectDriverScreen({super.key});

  @override
  State<SelectDriverScreen> createState() => _SelectDriverScreenState();
}

class _SelectDriverScreenState extends State<SelectDriverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(title: 'Select Car'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              children: [
                24.ph,
                const Divider(color: AppColors.dark3),
                24.ph,
                Text(
                  'Promo Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                16.ph,
                const PromosButton(),
              ],
            ),
          ),
          const SelectTransPrtBottomSheet()
        ],
      ),
    );
  }
}
