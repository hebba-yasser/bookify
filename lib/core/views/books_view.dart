import 'package:bookify/core/utils/functions/custom_show_toast.dart';
import 'package:bookify/core/views/widgets/books_view_body.dart';
import 'package:bookify/features/home/presentation/manager/fetch_new_arrival_book_cubit/fetch_new_arrival_book_cubit.dart';
import 'package:bookify/features/home/presentation/manager/fetch_new_arrival_book_cubit/fetch_new_arrival_book_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/book_model/book_model.dart';

class BooksView extends StatelessWidget {
  const BooksView(
      {Key? key,
      required this.title,
      required this.fetchNewArrivalBookCubit,
      required this.books})
      : super(key: key);
  final String title;
  final FetchNewArrivalBookCubit fetchNewArrivalBookCubit;
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    List<BookModel> booksList = books;
    return BlocProvider.value(
      value: fetchNewArrivalBookCubit,
      child: Scaffold(
        body: SafeArea(
            child: BlocConsumer<FetchNewArrivalBookCubit,
                FetchNewArrivalBookStates>(
          listener: (context, state) {
            if (state is FetchNewArrivalBookSuccess) {
              booksList.addAll(state.books);
            }

            if (state is FetchNewArrivalBookFailurePagination) {
              return customShowToast(state.errMessage);
            }
          },
          builder: (context, state) {
            if (state is FetchNewArrivalBookSuccess ||
                state is FetchNewArrivalBookLoadingPagination ||
                state is FetchNewArrivalBookFailurePagination) {
              return BooksViewBody(
                books: booksList,
                title: title,
              );
            } else if (state is FetchNewArrivalBookFailure) {
              return Text(state.errMessage);
            } else {
              return const CircularProgressIndicator();
            }
          },
        )),
      ),
    );
  }
}
