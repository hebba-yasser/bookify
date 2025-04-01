import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/models/book_model/book_model.dart';
import '../../../../../core/views/widgets/custom_app_bar.dart';
import '../../../../../core/views/widgets/paginated_grid_view.dart';
import '../../manager/fetch_search_cubit_cubit/fetch_search_cubit.dart';
import 'filter_container.dart';

class SearchResultViewBody extends StatelessWidget {
  const SearchResultViewBody({
    Key? key,
    required this.books,
    required this.query,
  }) : super(key: key);
  final List<BookModel> books;

  final String query;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Column(
        children: [
          CustomAppBar(title: 'Search Results '),
          Expanded(
            child: PaginatedGridView(
              books: books,
              onLoadMore: () async {
                await BlocProvider.of<FetchSearchBookCubit>(context)
                    .fetchSearchBook(query: query, loadMore: true);
              },
              noItemsFoundWidget: const Center(child: Text('No books found')),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FilterContainer(),
          ),
        ],
      ),
    );
  }
}
