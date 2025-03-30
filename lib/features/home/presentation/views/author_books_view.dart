import 'package:bookify/features/home/data/models/author_model/author_model.dart';
import 'package:bookify/features/home/data/repos/home_repo_imp.dart';
import 'package:bookify/features/home/presentation/manager/fetch_books_by_author_name_cubit/fetch_books_by_author_name_states.dart';
import 'package:bookify/features/home/presentation/views/widgets/author_books_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../../../core/utils/service_locator.dart';
import '../manager/fetch_books_by_author_name_cubit/fetch_books_by_author_name_cubit.dart';

class AuthorBooksView extends StatelessWidget {
  const AuthorBooksView({Key? key, required this.author}) : super(key: key);
  final AuthorModel author;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchBooksByAuthorNameCubit(getIt.get<HomeRepoImp>())
        ..fetchBooksByAuthorName(authorName: author.authorName),
      child: Scaffold(
        body: BlocBuilder<FetchBooksByAuthorNameCubit,
            FetchBooksByAuthorNameStates>(
          builder: (context, state) {
            if (state is FetchBooksByAuthorNameSuccess) {
              return SafeArea(
                  child: AuthorBooksViewBody(
                author: author,
                books: state.books,
              ));
            } else if (state is FetchBooksByAuthorNameFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return customLoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
