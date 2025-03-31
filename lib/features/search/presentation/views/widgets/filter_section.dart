import 'package:flutter/material.dart';

import '../../../../../core/data/data_sources/preferences_data_source.dart';
import 'filter_item.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FilterItem(
              title: 'Order By ',
              optionsList: [
                "newest",
                "relevance",
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: FilterItem(
              title: 'Filter Book Type',
              optionsList: [
                "ebooks",
                "free-ebooks",
                "full",
                "paid-ebooks",
                "partial",
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: FilterItem(
              title: 'language',
              optionsList: PreferencesDataSource.supportedLanguages
                  .map((lang) => lang["name"] as String)
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
