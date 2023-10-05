import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubits/get_driver_informations_cubit/get_driver_informations_cubit.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/ui/tab_box/bookings/sub_screens/widgets/widgets.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class DriverDetailScreen extends StatelessWidget {
  final RequestModel requestModel;

  const DriverDetailScreen({super.key, required this.requestModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          getTheme(context) ? Theme.of(context).scaffoldBackgroundColor : AppColors.c_100,
      appBar: AppBar(
        title: Text('Client detail', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: BlocBuilder<GetDriverInformationsCubit, GetDriverInformationsState>(
        builder: (context, state) {
          if (state is GetDriverInfoSuccess) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        clientHeaderInfoWidget(context, state.driver),
                        driverBodyInfoWidget(context, state.driver),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 36),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                      // color: getTheme(context) ? AppColors.dark3 : AppColors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconContainerWidget(icon: AppIcons.message, onTap: () {}),
                        24.pw,
                        IconContainerWidget(icon: AppIcons.call, onTap: () {}),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state is GetDriverInfoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetDriverInfoError) {
            return Center(child: Text(state.errorMessage));
          }
          return Center(child: Text(state.toString()));
        },
      ),
    );
  }
}
