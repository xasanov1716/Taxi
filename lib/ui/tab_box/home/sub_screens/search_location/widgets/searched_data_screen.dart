import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/blocs/search_location_bloc/places_bloc.dart';
import 'package:taxi_app/data/models/places/district_model.dart';
import 'package:taxi_app/data/models/places/quarter_model.dart';
import 'package:taxi_app/data/models/places/region_model.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/location_details/get_location_screen.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/mixins/highlight_text.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class LoadedDataScreen extends StatelessWidget {
  const LoadedDataScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchLocationBloc, PlacesState>(
      builder: (context, state) => ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineSmall,
                  children: [
                    const TextSpan(
                      text: "Results for ",
                    ),
                    TextSpan(
                      text: "\"${state.query}\"",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: AppColors.primary,
                              ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "${state.regions.length + state.districts.length + state.quarters.length} founds",
                ),
              ),
            ],
          ),
          24.ph,
          state.regions.isEmpty
              ? const SizedBox()
              : Text(
                  "Regions",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
          ...List.generate(state.regions.length, (index) {
            RegionModel regions = state.regions[index];

            return ListTile(
              onTap: () {
                context
                    .read<SearchLocationBloc>()
                    .add(CreateSearchHistoryEvent(regions.name));
              },
              titleAlignment: ListTileTitleAlignment.center,
              leading: Image.asset(AppIcons.locationInSearchDb),
              title: highlightText(regions.name, state.query, context),
              subtitle: Text(
                regions.id.toString(),
              ),
            );
          }),
          state.districts.isEmpty
              ? const SizedBox()
              : Text(
                  "Districts",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
          ...List.generate(state.districts.length, (index) {
            DistrictModel districts = state.districts[index];

            return ListTile(
              onTap: () {
                context
                    .read<SearchLocationBloc>()
                    .add(CreateSearchHistoryEvent(districts.name));
              },
              titleAlignment: ListTileTitleAlignment.center,
              leading: Image.asset(AppIcons.locationInSearchDb),
              title: highlightText(districts.name, state.query, context),
              subtitle: Text(
                districts.id.toString(),
              ),
            );
          }),
          state.quarters.isEmpty
              ? const SizedBox()
              : Text(
                  "Quarters",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
          ...List.generate(state.quarters.length, (index) {
            QuarterModel quarters = state.quarters[index];

            return ListTile(
              onTap: () {
                context
                    .read<SearchLocationBloc>()
                    .add(CreateSearchHistoryEvent(quarters.name));
              },
              titleAlignment: ListTileTitleAlignment.center,
              leading: Image.asset(AppIcons.locationInSearchDb),
              title: highlightText(quarters.name, state.query, context),
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
