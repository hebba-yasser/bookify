import 'package:bookify/core/views/widgets/square_book_item.dart';
import 'package:flutter/material.dart';

import '../../data/models/book_model/book_model.dart';
import '../../utils/functions/Navigaor_push.dart';
import '../book_details_view.dart';

class PaginatedGridView extends StatefulWidget {
  final List<BookModel> books;
  final Future<void> Function() onLoadMore;
  final Widget? noItemsFoundWidget;
  final double childAspectRatio;
  final int crossAxisCount;
  const PaginatedGridView({
    Key? key,
    required this.books,
    required this.onLoadMore,
    this.noItemsFoundWidget,
    this.childAspectRatio = 1.9 / 3,
    this.crossAxisCount = 2,
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
            BookDetailsView(bookId: widget.books[index].id!),
          ),
          child: SquareBookItem(book: widget.books[index]),
        );
      },
    );
  }
}
