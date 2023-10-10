import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/data/repositories/request_repo.dart';
import 'package:taxi_app/ui/tab_box/bookings/sub_screens/selected_request/widgets/select_request_client.dart';
import 'package:taxi_app/ui/tab_box/bookings/sub_screens/selected_request/widgets/select_request_driver.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/empty.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/utility_function.dart';
import 'package:taxi_app/data/local/search_location/places_db.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class SelectedRequestScreen extends StatefulWidget {
  const SelectedRequestScreen({super.key, required this.fromId, required this.toId});
  final int fromId;
  final int toId;

  @override
  State<SelectedRequestScreen> createState() => _SelectedRequestScreenState();
}

class _SelectedRequestScreenState extends State<SelectedRequestScreen> {
  String fromRegion = "";
  String toRegion = "";

  @override
  void initState() {
    _getFromRegions(id: widget.fromId);
    _getToRegions(id: widget.toId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          leading: getIcon(AppIcons.arrowLeft, context: context, onTap: () {
            Navigator.pop(context);
          }),
          title: Text("Requests", style: Theme.of(context).textTheme.headlineMedium),
          actions: [getIcon(AppIcons.moreCircle, context: context, onTap: () {}), 12.pw],
        ),
        body: StorageRepository.getString(StorageKeys.userRole) == "client"
            ? StreamBuilder<List<RequestModel>>(
                stream: context
                    .read<RequestRepo>()
                    .getDriverFromId(fromId: widget.fromId, toId: widget.toId),
                builder: (BuildContext context, AsyncSnapshot<List<RequestModel>> snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!.isNotEmpty
                        ? ListView(
                            children: [
                              12.ph,
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.w),
                                padding: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(
                                        color: getTheme(context)
                                            ? AppColors.white
                                            : AppColors.yellow)),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Center(
                                            child: Text(
                                      fromRegion,
                                      textAlign: TextAlign.center,
                                    ))),
                                    SizedBox(
                                      height: 45.w,
                                      width: 45.w,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(30.r),
                                          child: Image.asset(AppIcons.fromTo)),
                                    ),
                                    Expanded(
                                        child: Center(
                                            child: Text(
                                      toRegion,
                                      textAlign: TextAlign.center,
                                    ))),
                                  ],
                                ),
                              ),
                              12.ph,
                              ...List.generate(
                                  snapshot.data!.length,
                                  (index) => SelectRequestDriver(
                                        modelDriver: snapshot.data![index],
                                      ))
                            ],
                          )
                        : const Center(child: EmptyBookings());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: EmptyBookings());
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              )
            : StreamBuilder<List<RequestModel>>(
                stream: context
                    .read<RequestRepo>()
                    .getClientFromId(fromId: widget.fromId, toId: widget.toId),
                builder: (BuildContext context, AsyncSnapshot<List<RequestModel>> snapshot) {
                  if (snapshot.hasData) {
                    print([snapshot.data!.length]);
                    return snapshot.data!.isNotEmpty
                        ? ListView(
                            children: [
                              12.ph,
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.w),
                                padding: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(
                                        color: getTheme(context)
                                            ? AppColors.white
                                            : AppColors.yellow)),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Center(
                                            child: Text(
                                      fromRegion,
                                      textAlign: TextAlign.center,
                                    ))),
                                    SizedBox(
                                      height: 45.w,
                                      width: 45.w,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(30.r),
                                          child: Image.asset(AppIcons.fromTo)),
                                    ),
                                    Expanded(
                                        child: Center(
                                            child: Text(
                                      toRegion,
                                      textAlign: TextAlign.center,
                                    ))),
                                  ],
                                ),
                              ),
                              12.ph,
                              ...List.generate(
                                  snapshot.data!.length,
                                  (index) => SelectRequestClient(
                                        modelClient: snapshot.data![index],
                                      ))
                            ],
                          )
                        : const Center(child: EmptyBookings());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: EmptyBookings());
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ));
  }

  _getFromRegions({required int id}) async {
    List<String> fromRegions =
        (await PlacesDatabase.instance.getRegionById(id: id)).map((e) => e.name).toList();
    fromRegion = fromRegions.first;
    setState(() {});
  }

  _getToRegions({required int id}) async {
    List<String> toRegions =
        (await PlacesDatabase.instance.getRegionById(id: id)).map((e) => e.name).toList();
    toRegion = toRegions.first;
    setState(() {});
  }
}
