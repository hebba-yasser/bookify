import 'package:bookify/features/search/presentation/views/widgets/search_result_view_body.dart';
import 'package:flutter/material.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SearchResultViewBody()),
    );
  }
}
