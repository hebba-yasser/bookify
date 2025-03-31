import 'package:bookify/features/search/presentation/views/widgets/filter_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/fetch_search_cubit_cubit/fetch_search_cubit.dart';
import '../manager/filter_cubit/filter_cubit.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key, required this.fetchSearchBookCubit})
      : super(key: key);
  final FetchSearchBookCubit fetchSearchBookCubit;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FilterCubit(),
        ),
        BlocProvider.value(
          value: fetchSearchBookCubit, // Reuse existing cubit
        ),
      ],
      child: Scaffold(
        body: SafeArea(child: FilterViewBody()),
      ),
    );
  }
}
