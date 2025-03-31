import 'package:bookify/core/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import '../../cubits/fetch_similar_books_cubit/fetch_similar_books_state.dart';
import '../../data/models/book_model/book_model.dart';
import '../../utils/functions/custom_loading_indicator.dart';

class SimilarBooksBlocBuilder extends StatelessWidget {
  const SimilarBooksBlocBuilder({
    super.key,
    required this.currentBook,
  });
  final BookModel currentBook;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSimilarBooksCubit, FetchSimilarBooksState>(
      builder: (context, state) {
        if (state is FetchSimilarBooksSuccess) {
          return SimilarBooksSection(
            currentBook: currentBook,
            books: state.books,
          );
        } else if (state is FetchSimilarBooksFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return customLoadingIndicator();
        }
      },
    );
  }
}
