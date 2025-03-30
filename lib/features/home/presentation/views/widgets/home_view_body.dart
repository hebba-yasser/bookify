import 'package:bookify/features/home/presentation/views/widgets/recently_viewed_section.dart';
import 'package:flutter/material.dart';

import 'books_section.dart';
import 'circle_categories_section.dart';
import 'home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              HomeAppBar(),
              BooksSection(
                collectionTitle: 'New Arrivals',
              ),
              CircleCategoriesSection(
                title: 'Top Authors',
              ),
              RecentlyViewedSection(),
              CircleCategoriesSection(
                title: 'Top genres',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
