import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/search_location_bloc/places_bloc.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/search_location/widgets/query_not_found_screen.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/search_location/widgets/search_history_appbar.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/search_location/widgets/search_history_screen.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/search_location/widgets/searched_data_screen.dart';
import 'package:translit/translit.dart';

class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SearchLocationBloc>().add(GetSearchHistoryEvent(15));
    final FocusNode searchFocusNode = FocusNode();
    return Scaffold(
      appBar: SearchLocationAppBar(
        onChanged: (value) {
          String v = Translit().toTranslit(source: value);
          context.read<SearchLocationBloc>().add(UpdateQueryEvent(v));
        },
        filterOnTap: () {},
        searchFocusNode: searchFocusNode,
        hintText: 'Search',
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: BlocConsumer<SearchLocationBloc, PlacesState>(
          builder: (context, state) {
            if (state.status == FormStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.query.isEmpty) {
              return SearchHistoryScreen(
                onClearAllTap: () {
                  context
                      .read<SearchLocationBloc>()
                      .add(ClearSearchHistoryEvent());
                },
              );
            } else if (state.regions.length +
                    state.districts.length +
                    state.quarters.length ==
                0) {
              return const QueryNotFoundScreen();
            } else if (state.regions.isNotEmpty ||
                state.districts.isNotEmpty ||
                state.quarters.isNotEmpty && state.query.isNotEmpty) {
              return const LoadedDataScreen();
            } else if (state.history.isNotEmpty) {
              return SearchHistoryScreen(
                onClearAllTap: () {
                  context
                      .read<SearchLocationBloc>()
                      .add(ClearSearchHistoryEvent());
                },
              );
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
