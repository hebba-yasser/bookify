import 'package:bookify/constants.dart';
import 'package:bookify/core/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/models/book_model/book_model.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/views/widgets/paginated_grid_view.dart';
import '../../../data/models/author_model/author_model.dart';
import '../../manager/fetch_books_by_author_name_cubit/fetch_books_by_author_name_cubit.dart';
import 'author_info_section.dart';

class AuthorBooksViewBody extends StatelessWidget {
  const AuthorBooksViewBody(
      {Key? key, required this.author, required this.books})
      : super(key: key);
  final AuthorModel author;
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: 'Author Details'),
          AuthorInfoSection(
            author: author,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 10),
            child: Text(
              'Author\'s Books',
              style: AppFonts.heading20.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            thickness: 3,
            color: kPrimaryColor,
          ),
          Expanded(
            child: PaginatedGridView(
              books: books,
              onLoadMore: () async {
                await BlocProvider.of<FetchBooksByAuthorNameCubit>(context)
                    .fetchBooksByAuthorName(
                        loadMore: true, authorName: author.authorName);
              },
              noItemsFoundWidget: const Center(child: Text('No books found')),
            ),
          ),
        ],
      ),
    );
  }
}
