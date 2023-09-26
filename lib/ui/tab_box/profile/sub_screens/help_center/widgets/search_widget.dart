import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubits/search/search_cubit.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.onChanged});
  final ValueChanged onChanged;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final _searchController = TextEditingController();
  String searchItem = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, List<String>>(
      builder: (context, state) {
        return Column(
          children: [
            30.ph,
            Focus(
              onFocusChange: widget.onChanged,
              child: GlobalTextField(
                hintText: 'Search',
                controller: _searchController,
                onChanged: (value) {
                  context.read<SearchCubit>().search(value);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
