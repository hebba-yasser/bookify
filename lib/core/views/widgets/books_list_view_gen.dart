import 'package:bookify/core/utils/functions/Navigaor_push.dart';
import 'package:bookify/features/home/presentation/manager/fetch_new_arrival_book_cubit/fetch_new_arrival_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/book_model/book_model.dart';
import '../book_details_view.dart';
import 'book_list_view_item.dart';

class BooksListViewGen extends StatefulWidget {
  const BooksListViewGen({
    super.key,
    required this.books,
  });
  final List<BookModel> books;

  @override
  State<BooksListViewGen> createState() => _BooksListViewGenState();
}

class _BooksListViewGenState extends State<BooksListViewGen> {
  late final ScrollController scrollController;
  var nextPage = 1;

  var isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await context
            .read<FetchNewArrivalBookCubit>()
            .fetchNewArrivalBook(pageNumber: nextPage++);
        isLoading = false;
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
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: widget.books.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: GestureDetector(
              onTap: () {
                navigatorPush(
                    context,
                    BookDetailsView(
                      book: widget.books[index],
                    ));
              },
              child: BookListViewItem(
                book: widget.books[index],
              )),
        ),
      ),
    );
  }
}
