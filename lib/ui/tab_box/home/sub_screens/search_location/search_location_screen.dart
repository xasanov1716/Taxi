import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/blocs/search_location_bloc/places_bloc.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/search_location/widgets/query_not_found_screen.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/search_location/widgets/search_history_screen.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/search_location/widgets/searched_data_screen.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/custom_circular.dart';
import 'package:taxi_app/utils/ui_utils/loading_dialog.dart';

class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context
    //     .read<SearchLocationBloc>()
    //     .add(CreateSearchHistoryEvent("Tashkent"));
    context.read<SearchLocationBloc>().add(GetSearchHistoryEvent(15));
    final FocusNode searchFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        automaticallyImplyLeading: false, // Set this to false
        title: SizedBox(
          height: 58.h,
          child: GlobalTextField(
            onChanged: (value) {
              context
                  .read<SearchLocationBloc>()
                  .add(SearchRegionsByNameEvent(value));
              context
                  .read<SearchLocationBloc>()
                  .add(SearchQuartersByNameEvent(value));
              context
                  .read<SearchLocationBloc>()
                  .add(SearchDistrictsByNameEvent(value));
            },
            focusNode: searchFocusNode,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 12.w),
              child: SvgPicture.asset(
                AppIcons.search,
                colorFilter: ColorFilter.mode(
                    getTheme(context) ? AppColors.c_600 : AppColors.c_400,
                    BlendMode.srcIn),
              ),
            ),
            hintText: "Search",
            suffixIcon: IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.filter,
                  iconType: IconType.bold,
                ),
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: BlocConsumer<SearchLocationBloc, PlacesState>(
          builder: (context, state) {
            if (state.status == FormStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.query.isEmpty) {
              return const SearchHistoryScreen();
            }
            if (state.regions.length +
                    state.districts.length +
                    state.quarters.length ==
                0) {
              return const QueryNotFoundScreen();
            }
            if (state.regions.isNotEmpty ||
                state.districts.isNotEmpty ||
                state.quarters.isNotEmpty && state.query.isNotEmpty) {
              return const LoadedDataScreen();
            } else if (state.history.isNotEmpty) {
              return const SearchHistoryScreen();
            } else {
              return const Text("You Didn't added any data");
            }
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
