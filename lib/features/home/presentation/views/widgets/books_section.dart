import 'package:bookify/core/utils/functions/Navigaor_push.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/models/book_model/book_model.dart';
import '../../../../../core/views/books_view.dart';
import '../../../../../core/views/widgets/collection_title.dart';
import '../../manager/fetch_new_arrival_book_cubit/fetch_new_arrival_book_cubit.dart';
import 'books_list_view.dart';

class BooksSection extends StatelessWidget {
  const BooksSection({
    super.key,
    required this.collectionTitle,
    required this.books,
  });
  final String collectionTitle;
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: CollectionTitle(
            title: collectionTitle,
            onPressed: () {
              navigatorPush(
                  context,
                  BooksView(
                    books: books,
                    title: collectionTitle,
                    fetchNewArrivalBookCubit:
                        context.read<FetchNewArrivalBookCubit>(),
                  ));
            },
          ),
        ),
        BooksListView(
          books: books,
        ),
      ],
    );
  }
}
