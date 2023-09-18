import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/blocs/search_location_bloc/places_bloc.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/search_history/search_history_model.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class SearchHistoryScreen extends StatelessWidget {
  const SearchHistoryScreen({super.key});

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
                "Recent",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(
                onPressed: () {
                  context
                      .read<SearchLocationBloc>()
                      .add(CreateSearchHistoryEvent("Tashkent"));
                },
                child: const Text(
                  "Clear All",
                ),
              ),
            ],
          ),
          24.ph,
          Divider(color: getTheme(context) ? AppColors.dark3 : AppColors.c_200),
          ...List.generate(state.history.length, (index) {
            SearchHistoryModel history = state.history[index];

            return ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.timeCircle,
                  iconType: IconType.lightOutline,
                ),
                colorFilter:
                    const ColorFilter.mode(AppColors.c_500, BlendMode.srcIn),
              ),
              title: Text(history.query),
              subtitle: Text(
                history.timestamp.toString(),
              ),
            );
          })
        ],
      ),
    );
  }
}
