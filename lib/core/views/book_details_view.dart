import 'package:bookify/core/cubits/fetch_book_by_id_cubit/fetch_book_by_id_cubit.dart';
import 'package:bookify/core/cubits/fetch_book_by_id_cubit/fetch_book_by_id_state.dart';
import 'package:bookify/core/data/models/book_model/book_model.dart';
import 'package:bookify/core/utils/functions/custom_loading_indicator.dart';
import 'package:bookify/core/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import '../data/repos/shared_repo_imp.dart';
import '../utils/service_locator.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key, required this.book}) : super(key: key);
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchBookByIdCubit(getIt.get<SharedRepoImp>())
            ..FetchBookById(id: book.id!),
        ),
        BlocProvider(
          create: (context) =>
              FetchSimilarBooksCubit(getIt.get<SharedRepoImp>())
                ..FetchSimilarBooks(category: book.volumeInfo!.categories![0]),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<FetchBookByIdCubit, FetchBookByIdState>(
          builder: (context, state) {
            if (state is FetchBookByIdSuccess) {
              return SafeArea(
                  child: BookDetailsViewBody(
                bookModel: state.books,
              ));
            } else if (state is FetchBookByIdFailure) {
              return Center(child: Text(state.errMessage));
            } else {
              return customLoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
