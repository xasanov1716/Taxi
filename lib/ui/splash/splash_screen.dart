import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/blocs/driver_bloc/driver_bloc.dart';
import 'package:taxi_app/blocs/location_bloc/location_bloc.dart';
import 'package:taxi_app/data/models/driver/driver_fields.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

import '../../utils/size/screen_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init(BuildContext context) async {
    Future.microtask(() {
      context.read<LocationBloc>().add(GetLocationEvent());
    });
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    _init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocConsumer<LocationBloc, LocationState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 213 * height / 926,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30 * width / 428),
                height: 419 * height / 926,
                width: 367 * width / 428,
                child: Image.asset(AppIcons.taxiLogo),
              ),
              SizedBox(
                height: 114 * height / 812,
              ),
              SizedBox(
                height: 125 * width / 428,
                width: 125 * width / 428,
                child: Lottie.asset(
                  AppIcons.splashCircular,
                  fit: BoxFit.cover,
                ),
              )
            ],
          );
        },
        listener: (context, state) {
          if (state is LocationSuccessState) {
            context.read<DriverBloc>().updateDriverField(
                fieldKey: DriverFieldKeys.currentLocation,
                value: context.read<LocationBloc>().latLong);

            Navigator.pushReplacementNamed(
              context,
              RouteNames.appRoute,
            );
          }
        },
      ),
    );
  }
}
