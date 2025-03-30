import 'package:bookify/core/views/widgets/books_view_body.dart';
import 'package:flutter/material.dart';

class BooksView extends StatelessWidget {
  const BooksView({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BooksViewBody(
        title: title,
      )),
    );
  }
}
