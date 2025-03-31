import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/models/book_model/book_model.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../../core/views/book_details_view.dart';
import '../../../../../core/views/widgets/custom_app_bar.dart';
import '../../../../../core/views/widgets/square_book_item.dart';
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
              query: query,
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

class PaginatedGridView extends StatefulWidget {
  final List<BookModel> books;
  final Future<void> Function() onLoadMore;
  final Widget? noItemsFoundWidget;
  final double childAspectRatio;
  final int crossAxisCount;
  final String query;
  const PaginatedGridView({
    Key? key,
    required this.books,
    required this.onLoadMore,
    this.noItemsFoundWidget,
    this.childAspectRatio = 1.9 / 3,
    this.crossAxisCount = 2,
    required this.query,
  }) : super(key: key);

  @override
  State<PaginatedGridView> createState() => _PaginatedGridViewState();
}

class _PaginatedGridViewState extends State<PaginatedGridView> {
  late final scrollController;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        setState(() => isLoading = true);
        await widget.onLoadMore();
        setState(() => isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.books.isEmpty) {
      return widget.noItemsFoundWidget ??
          const Center(child: Text('No books found'));
    }

    return GridView.builder(
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: widget.childAspectRatio,
        crossAxisCount: widget.crossAxisCount,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
      ),
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        if (index >= widget.books.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          );
        }
        return GestureDetector(
          onTap: () => navigatorPush(
            context,
            BookDetailsView(book: widget.books[index]),
          ),
          child: SquareBookItem(book: widget.books[index]),
        );
      },
    );
  }
}
