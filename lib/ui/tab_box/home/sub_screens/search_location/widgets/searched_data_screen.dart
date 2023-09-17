import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/blocs/search_location_bloc/places_bloc.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/places/district_model.dart';
import 'package:taxi_app/data/models/places/quarter_model.dart';
import 'package:taxi_app/data/models/places/region_model.dart';
import 'package:taxi_app/data/models/search_history/search_history_model.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class LoadedDataScreen extends StatelessWidget {
  const LoadedDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchLocationBloc, PlacesState>(
      builder: (context, state) => ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Results for",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(
                onPressed: () {
                  context
                      .read<SearchLocationBloc>()
                      .add(CreateSearchHistoryEvent("Tashkent"));
                },
                child: Text(
                  "${state.regions.length + state.districts.length + state.quarters.length} founds",
                ),
              ),
            ],
          ),
          24.ph,
          ...List.generate(state.regions.length, (index) {
            RegionModel regions = state.regions[index];

            return ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: Image.asset(AppIcons.locationInSearchDb),
              title: Text(regions.name),
              subtitle: Text(
                regions.id.toString(),
              ),
            );
          }),
          ...List.generate(state.districts.length, (index) {
            DistrictModel districts = state.districts[index];

            return ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: Image.asset(AppIcons.locationInSearchDb),
              title: Text(districts.name),
              subtitle: Text(
                districts.id.toString(),
              ),
            );
          }),
          ...List.generate(state.quarters.length, (index) {
            QuarterModel quarters = state.quarters[index];

            return ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: Image.asset(AppIcons.locationInSearchDb),
              title: Text(quarters.name),
              subtitle: Text(
                quarters.id.toString(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
