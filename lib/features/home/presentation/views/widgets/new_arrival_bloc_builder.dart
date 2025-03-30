import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../manager/fetch_new_arrival_book_cubit/fetch_new_arrival_book_cubit.dart';
import '../../manager/fetch_new_arrival_book_cubit/fetch_new_arrival_book_states.dart';
import 'books_section.dart';

class NewArrivalBlocBuilder extends StatelessWidget {
  const NewArrivalBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewArrivalBookCubit, FetchNewArrivalBookStates>(
        builder: (context, state) {
      if (state is FetchNewArrivalBookSuccess) {
        return BooksSection(
          collectionTitle: 'New Arrivals',
          books: state.books,
        );
      } else if (state is FetchNewArrivalBookFailure) {
        return Center(
          child: Text(
            state.errMessage,
            textAlign: TextAlign.center,
          ),
        );
      } else {
        return customLoadingIndicator();
      }
    });
  }
}
