import 'package:bookify/features/search/presentation/views/widgets/filter_view_body.dart';
import 'package:flutter/material.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: FilterViewBody()),
    );
  }
}
