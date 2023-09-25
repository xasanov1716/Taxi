import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubits/search/search_cubit.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class SearchScreen extends StatelessWidget {
  final _searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchCubit, List<String>>(
        builder: (context, state) {
          return Column(
            children: [
              30.ph,
              GlobalTextField(
                hintText: 'Search',
                controller: _searchController,
                onChanged: (value) {
                  context.read<SearchCubit>().search(value);
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.isNotEmpty
                      ? state.length
                      : context.read<SearchCubit>().list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.isNotEmpty
                          ? state[index]
                          : context.read<SearchCubit>().list[index]),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
