import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/blocs/search_location_bloc/places_bloc.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class QueryNotFoundScreen extends StatelessWidget {
  const QueryNotFoundScreen({super.key});

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
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColors.primary)),
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
          100.ph,
          Image.asset(AppIcons.searchNotFound),
          40.ph,
          Text(
            'Not Found',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          12.ph,
          Text(
            'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
