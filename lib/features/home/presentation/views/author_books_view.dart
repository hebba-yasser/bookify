import 'package:bookify/features/home/presentation/views/widgets/author_books_view_body.dart';
import 'package:flutter/material.dart';

class AuthorBooksView extends StatelessWidget {
  const AuthorBooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: AuthorBooksViewBody()),
    );
  }
}
